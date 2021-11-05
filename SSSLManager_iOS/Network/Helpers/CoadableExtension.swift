//
//  CoadableExtension.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 05..
//

import Foundation

extension Encodable {
    var dictionary: [String: String] {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(self),
           let dictionary = try? JSONSerialization.jsonObject(with: data,
                                                              options: .allowFragments) as? [String: String] {
            return dictionary
        }
        return [:]
    }
}
