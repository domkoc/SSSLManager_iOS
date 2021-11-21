//
//  EventApplicantsTableViewCell.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 21..
//

import UIKit

struct EventApplicantsTableViewCellConfig {
    let profile: Profile
}

class EventApplicantsTableViewCell: UITableViewCell {
    @IBOutlet weak var usernameLabel: UILabel!
    private var profile: Profile?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func configure(with config: EventApplicantsTableViewCellConfig) {
        self.profile = config.profile
        if let nickname = self.profile!.nickname {
            usernameLabel.text = nickname
        } else {
            usernameLabel.text = self.profile!.fullname
        }
    }
}

extension EventApplicantsTableViewCell: NibLoadableView { }
