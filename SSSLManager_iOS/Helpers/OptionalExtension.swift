//
//  OptionalExtension.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 14..
//

import Foundation

extension Optional where Wrapped == String {
    var notEmptyValue: String? {
        guard let self = self else { return nil }
        return self.isEmpty ? nil : self
    }
    var isEmpty: Bool {
        guard let self = self else { return true }
        return self.isEmpty
    }
    var asInt: Int? {
        guard let self = self else { return nil }
        return Int(self)
    }
    var asDouble: Double? {
        guard let self = self else { return nil }
        return Double(self)
    }
}
