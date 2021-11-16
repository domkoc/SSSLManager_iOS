//
//  EventDetailsViewController.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 16..
//

import Foundation
import UIKit

protocol EventDetailsView: BaseView {
    var presenter: EventDetailsPresenterInput? { get set }
}

class EventDetailsViewController: UIViewController {
    var presenter: EventDetailsPresenterInput?
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeViews()
    }
    private func customizeViews() {
        
    }
}

extension EventDetailsViewController: EventDetailsView {
}
