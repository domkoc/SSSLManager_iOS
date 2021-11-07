//
//  Constants.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 05..
//

import Foundation

struct Constants {
    struct Network {
        static let webBaseUrl: String = "http://"
#if targetEnvironment(simulator)
        static let serverDomain: String = "127.0.0.1:8080"
#else
        static let serverDomain: String = "192.168.0.11:8080"
#endif
        static let serverBaseUrl: String = "\(webBaseUrl)\(serverDomain)"
        static let serverUrl: String = "\(serverBaseUrl)"
    }
    struct Token {
        static let tokenKey: String = "SSSL_TOKEN"
        static let expirationKey: String = "SSSL_TOKEN_EXPIRATION"
    }
}
