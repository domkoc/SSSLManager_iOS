//
//  SubEventsTableViewCell.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 22..
//

import UIKit

protocol SubEventsTableViewCellDelegate: UIViewController {
    func subEventSelected(_ event: Event)
}

struct SubEventsTableViewCellConfig {
    let event: Event
}

class SubEventsTableViewCell: UITableViewCell {
    @IBOutlet weak var eventButton: UIButton!
    private var event: Event?
    weak var delegate: SubEventsTableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func configure(with config: SubEventsTableViewCellConfig) {
        self.event = config.event
        eventButton.setTitle(self.event!.title, for: .normal)
    }
    @IBAction func eventButtonTapped(_ sender: UIButton) {
        guard let event = self.event else { return }
        delegate?.subEventSelected(event)
    }
}

extension SubEventsTableViewCell: NibLoadableView { }
