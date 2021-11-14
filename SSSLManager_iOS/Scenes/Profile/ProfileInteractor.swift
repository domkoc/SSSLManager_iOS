//
//  ProfileInteractor.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 12..
//

import Foundation

struct ProfileInteractorSuccess {
    enum Save {
        case saved
    }
}

enum ProfileInteractorError: Error {
    case error(String)
}

protocol ProfileInteractorInput: AnyObject {
    func saveProfile(credentials: EditedProfileCredentials,
                  completion: @escaping (Result<ProfileInteractorSuccess.Save,
                                         ProfileInteractorError>) -> Void)
}

class ProfileInteractor {
    private let profileApi: ProfileAPIInput
    init(profileApi: ProfileAPIInput) {
        self.profileApi = profileApi
    }
}

extension ProfileInteractor: ProfileInteractorInput {
    func saveProfile(credentials: EditedProfileCredentials,
                  completion: @escaping (Result<ProfileInteractorSuccess.Save,
                                         ProfileInteractorError>) -> Void) {
        profileApi.editProfile(with: credentials.dto) { result in
            switch result {
            case .success:
                completion(.success(.saved))
            case .error(let message):
                completion(.failure(.error(message)))
            }
        }
    }
}
