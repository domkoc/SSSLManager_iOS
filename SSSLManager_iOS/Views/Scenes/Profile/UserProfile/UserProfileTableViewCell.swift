//
//  UserProfileTableViewCell.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 13..
//

import UIKit

struct UserProfileTableViewCellConfig {
    let title: String
    let description: String
}

class UserProfileTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.textColor = Colors.greyLabelColor.color
    }
    func configure(with config: UserProfileTableViewCellConfig) {
        titleLabel.text = config.title
        descriptionLabel.text = config.description
    }
}

extension UserProfileTableViewCell: NibLoadableView {}
