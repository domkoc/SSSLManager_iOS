//
//  Constants.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 05..
//

import Foundation

struct Constants {
    struct Network {
        static let webBaseUrl: String = "https://"
        static let serverDomain: String = "localhost:8080"
        static let serverBaseUrl: String = "\(webBaseUrl)\(serverDomain)"
        static let serverUrl: String = "\(serverBaseUrl)"
    }
    struct Token {
        static let tokenKey: String = "SSSL_TOKEN"
        static let expirationKey: String = "SSSL_TOKEN_EXPIRATION"
    }
}
