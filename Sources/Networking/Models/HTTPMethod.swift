//
//  File.swift
//
//
//  Created by BELDIN Yaroslav on 20.04.2024.
//

import Foundation

public enum HTTPMethod {
    case connect
    case delete
    case get
    case head
    case options
    case patch
    case post
    case put
    case trace
    case custom(_ method: String)

    public var rawValue: String {
        switch self {
        case .connect: return "CONNECT"
        case .delete: return "DELETE"
        case .get: return "GET"
        case .head: return "HEAD"
        case .options: return "OPTIONS"
        case .patch: return "PATCH"
        case .post: return "POST"
        case .put: return "PUT"
        case .trace: return "TRACE"
        case let .custom(method):
            return method.uppercased()
        }
    }
}
