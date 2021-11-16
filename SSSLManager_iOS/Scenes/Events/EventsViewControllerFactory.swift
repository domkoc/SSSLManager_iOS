//
//  EventsViewControllerFactory.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 15..
//

import Foundation

class EventsViewControllerFactory {
    typealias Storyboard = StoryboardScene.Events
    class func makeAllEventsViewController() -> AllEventsViewController {
        Storyboard.allEventsViewController.instantiate()
    }
}