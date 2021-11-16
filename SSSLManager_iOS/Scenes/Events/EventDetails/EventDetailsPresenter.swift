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
    var presentationModel: EventDetailsPresentationModel? { get set }
}

class EventDetailsPresenter {
    weak var view: EventDetailsView?
    var interactor: EventsInteractorInput
    private let coordinator: EventsCoordinatorInput
    var presentationModel: EventDetailsPresentationModel?
    init(view: EventDetailsView,
         interactor: EventsInteractorInput,
         coordinator: EventsCoordinatorInput) {
        self.view = view
        self.interactor = interactor
        self.coordinator = coordinator
    }
}

extension EventDetailsPresenter: EventDetailsPresenterInput {
    
}
