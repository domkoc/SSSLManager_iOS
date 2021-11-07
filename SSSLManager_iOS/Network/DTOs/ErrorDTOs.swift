//
//  ErrorDTOs.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 05..
//

import Foundation

struct ErrorResponse: Decodable {
    let reason: String
}

struct EmptyDto: Codable { }
