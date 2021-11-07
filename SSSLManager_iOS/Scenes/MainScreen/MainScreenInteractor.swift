//
//  MainScreenInteractor.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 07..
//

import Foundation


enum MainScreenInteractorError: Error {
    case error(String)
}

protocol MainScreenInteractorInput: AnyObject {
    func getProfile(completion: @escaping (Result<Profile, MainScreenInteractorError>) -> Void)
}

class MainScreenInteractor {
    private let profileApi: ProfileAPIInput
    init(profileApi: ProfileAPIInput) {
        self.profileApi = profileApi
    }
}

extension MainScreenInteractor: MainScreenInteractorInput {
    func getProfile(completion: @escaping (Result<Profile, MainScreenInteractorError>) -> Void) {
        profileApi.getProfile { result in
            switch result {
            case .success(let profileDto):
                completion(.success(Profile(dto: profileDto)))
            case .error(let message):
                completion(.failure(.error(message)))
            }
        }
    }
}
