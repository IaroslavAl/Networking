//
//  File.swift
//
//
//  Created by BELDIN Yaroslav on 20.04.2024.
//

import Foundation

public struct HTTPHeader {
    let name: String
    let value: String

    public init(
        name: String,
        value: String
    ) {
        self.name = name
        self.value = value
    }
}

public extension HTTPHeader {
    static func contentType(_ value: MIMEType) -> HTTPHeader {
        HTTPHeader(name: "Content-Type", value: value.rawValue)
    }
}
