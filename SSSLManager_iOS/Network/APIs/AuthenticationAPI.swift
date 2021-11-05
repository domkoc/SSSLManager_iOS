//
//  AuthenticationAPI.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 05..
//

import Alamofire
import Foundation

protocol AuthenticationAPIInput {
    func login(with credentials: LoginDTO, completion: @escaping (APIBase.APIResult<UserCredentialsDto>) -> Void)
}

class AuthenticationAPI: APIBase { }

extension AuthenticationAPI: AuthenticationAPIInput {
    func login(with credentials: LoginDTO, completion: @escaping (APIBase.APIResult<UserCredentialsDto>) -> Void) {
        NetworkManager.shared.request(method: .post,
                                      path: "/users/login",
                                      body: credentials,
                                      isAuthenticated: false,
                                      completion: { (result: NetworkManager.Result<UserCredentialsDto>) in
                                        switch result {
                                        case .success(let loginData):
                                            completion(.success(loginData))
                                        case .customError(let error):
                                            completion(.error(error.errorsString))
                                        case .other:
                                            completion(.error("other error"))
                                        }
                                      })
    }
}
