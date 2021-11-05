//
//  APIBase.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 05..
//

import Foundation

class APIBase {
    enum APIResult<T> {
        case success(T)
        case error(String)
    }
    enum EmptyAPIResult {
        case success
        case error(String)
    }
}
