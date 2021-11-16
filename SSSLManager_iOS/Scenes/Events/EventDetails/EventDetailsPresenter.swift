//
//  EventDetailsPresenter.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 16..
//

import Foundation

protocol EventDetailsPresenterInput: AnyObject {
    var view: EventDetailsView? { get set }
    var interactor: EventsInteractorInput { get set }
    var presentationModel: EventDetailsPresentationModel { get set }
    func loadEventData()
    func navigateToOrganizerProfile()
}

class EventDetailsPresenter {
    weak var view: EventDetailsView?
    var interactor: EventsInteractorInput
    private let coordinator: EventsCoordinatorInput
    var presentationModel: EventDetailsPresentationModel
    init(view: EventDetailsView,
         interactor: EventsInteractorInput,
         coordinator: EventsCoordinatorInput,
         presentationModel: EventDetailsPresentationModel) {
        self.view = view
        self.interactor = interactor
        self.coordinator = coordinator
        self.presentationModel = presentationModel
    }
}

extension EventDetailsPresenter: EventDetailsPresenterInput {
    func loadEventData() {
        interactor.getProfileById(id: presentationModel.event.organizerID) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let profile):
                self.presentationModel.organizer = profile
                self.view?.loadData(self.presentationModel)
            case .failure(.error(let message)):
                self.view?.showErrorAlert(message: message, handler: nil)
            }
        }
    }
    func navigateToOrganizerProfile() {
        guard let profile = presentationModel.organizer else { return }
        coordinator.navigateToProfile(of: profile)
    }
}
