//
//  File.swift
//
//
//  Created by BELDIN Yaroslav on 20.04.2024.
//

import Foundation

public struct NetworkManager {
    private let service: NetworkService

    public init() {
        self.init(service: Service())
    }

    init(service: Service) {
        self.service = service
    }

    public func execute<T: Request>(request: T) async throws -> T.Response {
        do {
            return try await service.execute(request: request).get()
        } catch {
            throw error
        }
    }
}
