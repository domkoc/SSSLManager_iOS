//
//  ErrorManager.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 07..
//

import Foundation

protocol ErrorManagerInput {
    func errorMessage(for errorResponse: ErrorResponse) -> String
    func errorMessage(for error: Error) -> String
    func errorMessage() -> String
}

class ErrorManager {
    static let shared = ErrorManager()
    private init() { }
}

extension ErrorManager: ErrorManagerInput {
    func errorMessage(for errorResponse: ErrorResponse) -> String {
        errorResponse.reason
    }
    func errorMessage(for error: Error) -> String {
        error.localizedDescription.isEmpty ? "Unknown error" : error.localizedDescription
    }
    func errorMessage() -> String {
        "Unknown error"
    }
}
