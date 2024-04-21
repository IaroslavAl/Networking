//
//  File.swift
//  
//
//  Created by BELDIN Yaroslav on 20.04.2024.
//

import Foundation

public enum NetworkError: Error, Decodable {
    case invalidURL
    case invalidResponse
    case bodyEncodingFailed
    case responseDecodingFailed(_ statusCode: Int)
    case errorDecodingFailed(_ statusCode: Int)
    case getResponseError
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidURL: "invalidURL"
        case .invalidResponse: "invalidResponse"
        case .bodyEncodingFailed: "bodyEncodingFailed"
        case .responseDecodingFailed(let statusCode): "responseDecodingFailed \(statusCode)"
        case .errorDecodingFailed(let statusCode): "errorDecodingFailed \(statusCode)"
        case .getResponseError: "getResponseError"
        }
    }
}
