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
    @IBOutlet weak var userDetailsTableView: UITableView!
    @IBOutlet weak var editButtonHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var editButtonTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var editButton: UIButton!
    var presenter: UserProfilePresenterInput?
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeViews()
    }
    private func customizeViews() {
        customizeTableView()
        customizeEditButton()
    }
    private func customizeTableView() {
        userDetailsTableView.delegate = self
        userDetailsTableView.dataSource = self
        userDetailsTableView.registerCell(UserProfileTableViewCell.self)
    }
    private func customizeEditButton() {
        if !(presenter?.isMyProfile() ?? false) {
            editButtonHeightConstraint.constant = 0
            editButtonTopConstraint.constant = 0
            editButton.isHidden = true
        }
    }
    @IBAction func editButtonTapped(_ sender: UIButton) {
        presenter?.navigateToEditProfile()
    }
    @IBAction func usersEventsButtonTapped(_ sender: UIButton) {
        presenter?.navigateToUsersEvents()
    }
}

extension UserProfileViewController: UserProfileView {
}

extension UserProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.presentationModel.profile.getRepresentableValues().count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserProfileTableViewCell = tableView.dequeueReusableCell()
        cell.configure(with: (presenter?.presentationModel.profile.getRepresentableValues()[indexPath.row])!)
        return cell
    }
}
extension UserProfileViewController: UITableViewDelegate {
    
}
