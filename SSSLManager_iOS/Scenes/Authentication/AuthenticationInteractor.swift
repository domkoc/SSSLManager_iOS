//
//  AuthenticationInteractor.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 05..
//

import Foundation

protocol AuthenticationInteractorInput: AnyObject {
    func login(credentials: Login,
               completion: @escaping (Result<AuthenticationServiceSuccess.Login,
                                      AuthenticationServiceError>) -> Void)
}

class AuthenticationInteractor {
    private let authenticationApi: AuthenticationAPIInput
    private let profileApi: ProfileAPIInput
    private let authenticationService: AuthenticationService
    init(authenticationApi: AuthenticationAPIInput,
         profileApi: ProfileAPIInput,
         authenticationService: AuthenticationService) {
        self.authenticationApi = authenticationApi
        self.profileApi = profileApi
        self.authenticationService = authenticationService
    }
}

extension AuthenticationInteractor: AuthenticationInteractorInput {
    func login(credentials: Login, completion: @escaping (Result<AuthenticationServiceSuccess.Login, AuthenticationServiceError>) -> Void) {
        authenticationService.loginWithCredentials(credentials: credentials) { result in
            switch result {
            case .success(let loginResult):
                completion(.success(loginResult))
            case .failure(.error(let message)):
                completion(.failure(.error(message)))
            }
        }
    }
}
