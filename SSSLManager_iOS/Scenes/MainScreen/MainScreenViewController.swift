//
//  MainScreenViewController.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 07..
//

import Foundation
import UIKit

protocol MainScreenView: BaseView {
    var presenter: MainScreenPresenterInput? { get set }
    func loadProfileData(_ presentationModel: MainScreenPresentationModel)
}

class MainScreenViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    var presenter: MainScreenPresenterInput?
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.loadProfileData()
    }
    private func customizeViews() {
        
    }
}

extension MainScreenViewController: MainScreenView {
    func loadProfileData(_ presentationModel: MainScreenPresentationModel) {
        label.text = "Hello \(presentationModel.profile.fullname)!"
    }
}
