//
//  AppCoordinator.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 05..
//

import UIKit

class AppCoordinator {
    private let window: UIWindow
    private let rootViewController: UINavigationController
    private var authenticationCoordinator: AuthenticationCoordinator?
    init?(window: UIWindow?) {
        guard let window = window else { return nil }
        self.window = window
        self.rootViewController = UINavigationController()
        self.rootViewController.setNavigationBarHidden(true, animated: false)
        window.rootViewController = rootViewController
        NetworkConfigurator.shared.configure(coordinator: self)
    }
    func start() {
        self.authenticationCoordinator = AuthenticationCoordinator(rootViewController: rootViewController,
                                                                   appCoordinator: self)
        authenticationCoordinator?.start()
    }
    func navigateBackToLogin() {
        authenticationCoordinator?.navigateBackToLogin()
    }
}
