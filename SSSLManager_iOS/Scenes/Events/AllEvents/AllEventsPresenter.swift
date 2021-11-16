//
//  AllEventsPresenter.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 15..
//

import Foundation

protocol AllEventsPresenterInput: AnyObject {
    var view: AllEventsView? { get set }
    var interactor: EventsInteractorInput { get set }
    var presentationModel: AllEventsPresentationModel? { get set }
    func loadEventsData()
    func navigateToNewEvent()
}

class AllEventsPresenter {
    weak var view: AllEventsView?
    var interactor: EventsInteractorInput
    private let coordinator: EventsCoordinatorInput
    var presentationModel: AllEventsPresentationModel?
    init(view: AllEventsView, interactor: EventsInteractorInput, coordinator: EventsCoordinatorInput) {
        self.view = view
        self.interactor = interactor
        self.coordinator = coordinator
    }
}

extension AllEventsPresenter: AllEventsPresenterInput {
    func loadEventsData() {
        interactor.getEvents { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let events):
                let tempPresentationModel = AllEventsPresentationModel(events: events)
                self.view?.loadEventsData(tempPresentationModel)
            case .failure(.error(let message)):
                self.view?.showErrorAlert(message: message, handler: nil)
            }
            
        }
    }
    func navigateToNewEvent() {
        coordinator.navigateToNewEvent()
    }
}
