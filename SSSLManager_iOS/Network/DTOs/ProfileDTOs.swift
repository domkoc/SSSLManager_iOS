//
//  ProfileDTOs.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 05..
//

import Foundation

enum SCHgroup: String, Codable {
    case sir
    case nyuszi
    case ttny
    case drwu
    case fekete
}

enum Roles: String, Codable {
    case user
    case admin
}

struct ProfileDownloadDto: Codable {
    let username: String?
    let id: UUID?
    let fullname: String
    let nickname: String?
    let schgroup: SCHgroup?
    let roles: [Roles]
    let createdAt: Date?
    let updatedAt: Date?
}
