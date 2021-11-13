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
    var presenter: UserProfilePresenterInput?
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeViews()
    }
    func customizeViews() {
        customizeTableView()
    }
    func customizeTableView() {
        userDetailsTableView.delegate = self
        userDetailsTableView.dataSource = self
        userDetailsTableView.registerCell(UserProfileTableViewCell.self)
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
