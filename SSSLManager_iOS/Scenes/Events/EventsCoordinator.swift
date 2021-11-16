//
//  EventsCoordinator.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 15..
//

import Foundation
import UIKit

protocol EventsCoordinatorInput {
    func navigateToNewEvent()
}

class EventsCoordinator {
    private weak var rootViewController: UINavigationController?
    private weak var appCoordinator: AppCoordinator?
    private let eventApi: EventAPIInput
    private let interactor: EventsInteractorInput
    init(rootViewController: UINavigationController,
         appCoordinator: AppCoordinator) {
        self.rootViewController = rootViewController
        self.appCoordinator = appCoordinator
        self.eventApi = EventAPI()
        self.interactor = EventsInteractor(eventApi: eventApi)
    }
    func start() {
        let allEventsViewController = EventsViewControllerFactory.makeAllEventsViewController()
        let allEventsPresenter = AllEventsPresenter(view: allEventsViewController,
                                                    interactor: self.interactor,
                                                    coordinator: self)
        allEventsViewController.presenter = allEventsPresenter
        rootViewController?.setNavigationBarHidden(false, animated: false)
        rootViewController?.pushViewController(allEventsViewController, animated: true)
    }
}

extension EventsCoordinator: EventsCoordinatorInput {
    func navigateToNewEvent() {
        let newEventViewController = EventsViewControllerFactory.makeNewEventViewController()
        let newEventPresenter = NewEventPresenter(view: newEventViewController,
                                                  interactor: self.interactor,
                                                  coordinator: self)
        newEventViewController.presenter = newEventPresenter
        rootViewController?.setNavigationBarHidden(false, animated: true)
        rootViewController?.pushViewController(newEventViewController, animated: true)
    }
}
