//
//  AuthenticationCoordinator.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 05..
//

import Foundation
import UIKit

protocol AuthenticationCoordinatorInput {
    func navigateToRegistration()
    func navigateToLogin()
    func navigateToMainScreen()
    func navigateBackToLogin()
}

class AuthenticationCoordinator {
    private weak var rootViewController: UINavigationController?
    private weak var appCoordinator: AppCoordinator?
    private let authenticationApi: AuthenticationAPIInput
    private let profileApi: ProfileAPIInput
    private var interactor: AuthenticationInteractorInput
    private let authenticationService: AuthenticationService
    init(rootViewController: UINavigationController, appCoordinator: AppCoordinator) {
        self.rootViewController = rootViewController
        self.appCoordinator = appCoordinator
        self.authenticationApi = AuthenticationAPI()
        self.profileApi = ProfileAPI()
        self.interactor = AuthenticationInteractor(authenticationApi: authenticationApi,
                                                   profileApi: profileApi,
                                                   authenticationService: AuthenticationService.shared)
        self.authenticationService = .shared
    }
    func start() {
        navigateToLogin()
        if authenticationService.hasValidAccessToken {
            navigateToMainScreen()
        }
    }
}

extension AuthenticationCoordinator: AuthenticationCoordinatorInput {
    func navigateToRegistration() { }
    func navigateToLogin() {
        let loginViewController = AuthenticationViewControllerFactory.makeLoginViewController()
//        let presenter = LoginPresenter(coordinator: self,
//                                       interactor: interactor,
//                                       view: loginViewController)
//        loginViewController.presenter = presenter
        rootViewController?.setNavigationBarHidden(true, animated: false)
        rootViewController?.pushViewController(loginViewController, animated: true)
    }
    func navigateToMainScreen() { }
    func navigateBackToLogin() { }
}
