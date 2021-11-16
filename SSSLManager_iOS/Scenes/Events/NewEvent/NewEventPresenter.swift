//
//  NewEventPresenter.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 16..
//

import Foundation

protocol NewEventPresenterInput: AnyObject {
    var view: NewEventView? { get set }
    var interactor: EventsInteractorInput { get set }
    var presentationModel: NewEventPresentationModel? { get set }
    func saveNewEvent(_ event: NewEvent)
}

class NewEventPresenter {
    weak var view: NewEventView?
    var interactor: EventsInteractorInput
    private let coordinator: EventsCoordinatorInput
    var presentationModel: NewEventPresentationModel?
    init(view: NewEventView,
         interactor: EventsInteractorInput,
         coordinator: EventsCoordinatorInput) {
        self.view = view
        self.interactor = interactor
        self.coordinator = coordinator
    }
}

extension NewEventPresenter: NewEventPresenterInput {
    func saveNewEvent(_ event: NewEvent) {
        interactor.createNewEvent(newEvent: event) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let event):
                self.view?.showSuccessAlert(message: "Saved \(event.title)", handler: nil)
//                self.coordinator.navigateBackToLogin()
            case .failure(.error(let message)):
                self.view?.showErrorAlert(message: message) { _ in
                    self.view?.enableDoneButton()
                }
            }
        }
    }
}
