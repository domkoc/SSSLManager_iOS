//
//  UserProfilePresenter.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 12..
//

import Foundation

protocol UserProfilePresenterInput: AnyObject {
    var view: UserProfileView? { get set }
    var interactor: ProfileInteractorInput { get set }
    var presentationModel: UserProfilePresentationModel { get set }
    func navigateToEditProfile()
    func isMyProfile() -> Bool
}

class UserProfilePresenter {
    weak var view: UserProfileView?
    var interactor: ProfileInteractorInput
    private let coordinator: ProfileCoordinatorInput
    var presentationModel: UserProfilePresentationModel
    internal init(coordinator: ProfileCoordinatorInput,
                  interactor: ProfileInteractorInput,
                  view: UserProfileView,
                  presentationModel: UserProfilePresentationModel) {
        self.view = view
        self.interactor = interactor
        self.coordinator = coordinator
        self.presentationModel = presentationModel
    }
}

extension UserProfilePresenter: UserProfilePresenterInput {
    func navigateToEditProfile() {
        coordinator.navigateToEditProfile(with: presentationModel.profile)
    }
    func isMyProfile() -> Bool {
        presentationModel.profile.id == UserService.shared.currentUser?.id
    }
}
