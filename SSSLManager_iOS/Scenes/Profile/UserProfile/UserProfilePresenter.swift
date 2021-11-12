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
}

class UserProfilePresenter {
    weak var view: UserProfileView?
    var interactor: ProfileInteractorInput
    private let coordinator: ProfileCoordinatorInput
    internal init(coordinator: ProfileCoordinatorInput,
                  interactor: ProfileInteractorInput,
                  view: UserProfileView) {
        self.view = view
        self.interactor = interactor
        self.coordinator = coordinator
    }
}

extension UserProfilePresenter: UserProfilePresenterInput {
    
}