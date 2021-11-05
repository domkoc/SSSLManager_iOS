//
//  ErrorDTOs.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 05..
//

import Foundation

struct ErrorDto: Codable {
    var errorCode: Int?
    var errorKey: String?
    var defaultMessage: String?
    var parameters: [String]?
}

struct ErrorResponse: Decodable {
    var traceId: String?
    var errors: [ErrorDto]?
}

extension ErrorResponse {
    var errorsString: String {
        errors?.compactMap { $0.defaultMessage }.joinedWithNewLine ?? ""
    }
}

struct EmptyDto: Codable { }
