//
//  File.swift
//
//
//  Created by BELDIN Yaroslav on 24.04.2024.
//

import Foundation

public enum MIMEType {
    case json
    case custom(_ type: String)

    public var rawValue: String {
        switch self {
        case .json: return "application/json"
        case let .custom(type):
            return type.lowercased()
        }
    }
}
