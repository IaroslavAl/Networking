//
//  File.swift
//
//
//  Created by BELDIN Yaroslav on 20.04.2024.
//

import Foundation

struct Service: NetworkService {
    func execute<T: Request>(
        request: T
    ) async throws -> Result<T.Response, T.Error> {
        guard let url = URL(string: request.url) else {
            throw NetworkError.invalidURL
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        if T.Body.self != Never.self {
            do {
                urlRequest.httpBody = try JSONEncoder().encode(request.body)
            } catch {
                throw NetworkError.bodyEncodingFailed
            }
        }
        request.headers.headers.forEach {
            urlRequest.addValue($0.value, forHTTPHeaderField: $0.name)
        }

        let (data, urlResponse) = try await URLSession.shared.data(for: urlRequest)

        guard let httpResponse = urlResponse as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        if (200 ... 299).contains(httpResponse.statusCode) {
            do {
                let response = try T.getResponse(from: data)
                return .success(response)
            } catch {
                throw NetworkError.responseDecodingFailed(httpResponse.statusCode)
            }
        } else {
            do {
                let error = try T.getError(from: data)
                return .failure(error)
            } catch {
                throw NetworkError.errorDecodingFailed(httpResponse.statusCode)
            }
        }
    }
}
