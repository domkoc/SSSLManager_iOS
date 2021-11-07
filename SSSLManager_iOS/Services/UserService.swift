//
//  UserService.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 05..
//

import Foundation

class UserService {
    struct User: Codable {
        let id: UUID
        let username: String
    }
    static let shared = UserService()
    private init() { }
    private let currentUserKey = "SSSL_CURRENTUSER"
    private let userDefaults = UserDefaults.standard
    var currentUser: User? {
        get {
            guard let savedUser = userDefaults.data(forKey: currentUserKey),
                  let loadedUser = try? JSONDecoder().decode(User.self, from: savedUser) else {
                AuthenticationService.shared.clearUserData()
                return nil
            }
            return loadedUser
        } set {
            let encodedUser = try? JSONEncoder().encode(newValue)
            userDefaults.set(encodedUser, forKey: currentUserKey)
        }
    }
}
