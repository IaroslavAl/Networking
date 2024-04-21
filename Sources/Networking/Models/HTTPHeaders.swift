//
//  File.swift
//  
//
//  Created by BELDIN Yaroslav on 20.04.2024.
//

import Foundation

public struct HTTPHeaders {
    public private(set) var headers = [HTTPHeader]()
    
    public init() {}
    
    public init(_ headers: [HTTPHeader]) {
        headers.forEach { update($0) }
    }
    
    public mutating func add(_ header: HTTPHeader) {
        update(header)
    }
    
    public mutating func update(_ header: HTTPHeader) {
        guard let index = headers.lastIndex(where: { $0.name == header.name }) else {
            headers.append(header)
            return
        }
        headers[index] = header
    }
}

extension HTTPHeaders: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: HTTPHeader...) {
        self.init(elements)
    }
    
    public static func + (lhs: HTTPHeaders, rhs: HTTPHeaders) -> HTTPHeaders {
        .init(lhs.headers + rhs.headers)
    }
}
