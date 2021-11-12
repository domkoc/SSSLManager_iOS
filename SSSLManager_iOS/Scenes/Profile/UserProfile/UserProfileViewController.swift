//
//  UserProfileViewController.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 12..
//

import Foundation
import UIKit

protocol UserProfileView: BaseView {
    var presenter: UserProfilePresenterInput? { get set }
}

class UserProfileViewController: UIViewController {
    var presenter: UserProfilePresenterInput?
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeViews()
    }
    func customizeViews() {
        
    }
}

extension UserProfileViewController: UserProfileView {
}
