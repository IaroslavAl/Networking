//
//  File.swift
//
//
//  Created by BELDIN Yaroslav on 20.04.2024.
//

import Foundation

public protocol Request {
    associatedtype Query: Encodable = Never
    associatedtype Body: Encodable = Never
    associatedtype Response: Sendable
    associatedtype Error: Swift.Error, Sendable

    var query: Query { get }
    var body: Body { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders { get }
    var url: String { get }

    static func getResponse(from data: Data) throws -> Response
    static func getError(from data: Data) throws -> Error
}

public extension Request where Response == Void {
    static func getResponse(data: Data) throws -> Response {
        return ()
    }
}

public extension Request where Response == Data {
    static func getResponse(data: Data) throws -> Response {
        return data
    }
}

public extension Request where Response: Decodable {
    static func getResponse(data: Data) throws -> Response {
        return try JSONDecoder().decode(Response.self, from: data)
    }
}

public extension Request where Error: Decodable {
    static func getError(data: Data) throws -> Error {
        return try JSONDecoder().decode(Error.self, from: data)
    }
}

public extension Request where Query == Never {
    var query: Query {
        fatalError("Query should not be called when the Query type is Never")
    }
}

public extension Request where Body == Never {
    var body: Body {
        fatalError("Body should not be called when the Body type is Never")
    }
}

extension Never: Encodable {
    public func encode(to _: Encoder) throws {
        fatalError("Never should not be encode")
    }
}
