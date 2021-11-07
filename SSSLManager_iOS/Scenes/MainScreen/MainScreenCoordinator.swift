//
//  MainCoordinator.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 07..
//

import Foundation
import UIKit

protocol MainScreenCoordinatorInput {
    func navigateBackToRoot()
}

class MainScreenCoordinator {
    private let rootViewController: UINavigationController
    private var appCoordinator: AppCoordinator
    private let profileApi: ProfileAPIInput
    init(rootViewController: UINavigationController,
         appCoordinator: AppCoordinator) {
        self.rootViewController = rootViewController
        self.appCoordinator = appCoordinator
        self.profileApi = ProfileAPI()
    }
    func start() {
        navigateMainScreen()
        navigateBackToRoot()
    }
    func navigateMainScreen() {
        let mainScreenViewController = MainScreenViewControllerFactory.makeMainScreenViewController()
        let interactor = MainScreenInteractor(profileApi: self.profileApi)
        let presenter = MainScreenPresenter(coordinator: self,
                                           interactor: interactor,
                                           view: mainScreenViewController)
        mainScreenViewController.presenter = presenter
        rootViewController.setNavigationBarHidden(false, animated: false)
//        rootViewController.pushViewController(mainScreenViewController, animated: true)
        rootViewController.setViewControllers([mainScreenViewController], animated: false)
    }
}

extension MainScreenCoordinator: MainScreenCoordinatorInput {
    func navigateBackToRoot() {
        rootViewController.popToRootViewController(animated: false)
    }
}
