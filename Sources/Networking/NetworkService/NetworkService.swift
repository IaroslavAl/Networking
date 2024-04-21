//
//  File.swift
//  
//
//  Created by BELDIN Yaroslav on 20.04.2024.
//

import Foundation

protocol NetworkService {
    func execute<T: Request>(request: T) async throws -> Result<T.Response, T.Error>
}
