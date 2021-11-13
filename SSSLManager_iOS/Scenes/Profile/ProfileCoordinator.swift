//
//  ProfileCoordinator.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 12..
//

import Foundation
import UIKit

protocol ProfileCoordinatorInput {
    
}

class ProfileCoordinator {
    private weak var rootViewController: UINavigationController?
    private weak var appCoordinator: AppCoordinator?
    private let profileApi: ProfileAPIInput
    private let interactor: ProfileInteractorInput
    init(rootViewController: UINavigationController,
         appCoordinator: AppCoordinator) {
        self.rootViewController = rootViewController
        self.appCoordinator = appCoordinator
        self.profileApi = ProfileAPI()
        self.interactor = ProfileInteractor(profileApi: profileApi)
    }
    func start(with profile: Profile) {
        let userProfileViewController = ProfileViewControllerFactory.makeUserProfileViewController()
        let userProfilePresenter = UserProfilePresenter(coordinator: self,
                                                        interactor: self.interactor,
                                                        view: userProfileViewController,
                                                        presentationModel: UserProfilePresentationModel(profile: profile))
        userProfileViewController.presenter = userProfilePresenter
        rootViewController?.setNavigationBarHidden(false, animated: false)
        rootViewController?.pushViewController(userProfileViewController, animated: true)
    }
}

extension ProfileCoordinator: ProfileCoordinatorInput {
    
}
