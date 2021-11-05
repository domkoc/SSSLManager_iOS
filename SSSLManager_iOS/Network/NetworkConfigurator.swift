//
//  NetworkConfigurator.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 05..
//

import Alamofire
import Foundation

class NetworkConfigurator {
    static let shared = NetworkConfigurator()
    let tokenManager: TokenManager
    private let authenticator: SSSLAuthenticator
    let interceptor: AuthenticationInterceptor<SSSLAuthenticator>
    let serverUrl = Constants.Network.serverUrl
    let serverBaseUrl = Constants.Network.serverBaseUrl
    private init() {
        tokenManager = KeyChainTokenManager.shared
        authenticator = SSSLAuthenticator(tokenManager: tokenManager)
        var credential: SSSLAuthCredentials?
        if let token = tokenManager.get() {
            credential = SSSLAuthCredentials(token: token)
        }
        interceptor = AuthenticationInterceptor(authenticator: authenticator,
                                                credential: credential)
    }
    func configure(coordinator: AppCoordinator) {
        authenticator.coordinator = coordinator
    }
}
