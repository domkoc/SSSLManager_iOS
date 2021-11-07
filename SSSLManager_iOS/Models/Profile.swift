//
//  Profile.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 07..
//

import Foundation


struct Profile: Codable {
    let username: String?
    let id: UUID?
    let fullname: String
    let nickname: String?
    let schgroup: SCHgroup?
    let roles: [Roles]
    let createdAt: Date?
    let updatedAt: Date?
    init(username: String?,
         id: UUID?,
         fullname: String,
         nickname: String?,
         schgroup: SCHgroup?,
         roles: [Roles],
         createdAt: Date?,
         updatedAt: Date?) {
        self.username = username
        self.id = id
        self.fullname = fullname
        self.nickname = nickname
        self.schgroup = schgroup
        self.roles = roles
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
    init(dto: ProfileDownloadDto) {
        self.username = dto.username
        self.id = dto.id
        self.fullname = dto.fullname
        self.nickname = dto.nickname
        self.schgroup = dto.schgroup
        self.roles = dto.roles
        self.createdAt = dto.createdAt
        self.updatedAt = dto.updatedAt
    }
    
}
