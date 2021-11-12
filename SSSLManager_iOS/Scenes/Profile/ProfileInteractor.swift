//
//  ProfileInteractor.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 12..
//

import Foundation

protocol ProfileInteractorInput: AnyObject {
    
}

class ProfileInteractor {
    private let profileApi: ProfileAPIInput
    init(profileApi: ProfileAPIInput) {
        self.profileApi = profileApi
    }
}

extension ProfileInteractor: ProfileInteractorInput {
    
}
