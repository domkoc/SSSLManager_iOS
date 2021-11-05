//
//  ArrayExtension.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 05..
//

import Foundation

extension Array where Element: Hashable {
    var withoutDuplicates: Array { Array(Set(self)) }
}
extension Array where Element == String {
    var joinedWithNewLine: String { joined(separator: "\n") }
}
