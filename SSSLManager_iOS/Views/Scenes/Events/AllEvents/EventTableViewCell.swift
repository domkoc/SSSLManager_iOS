//
//  EventTableViewCell.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 15..
//

import UIKit

struct EventTableViewCellConfig {
    let title: String
    let eventStart: Date
    let eventEnd: Date
    let isApplyable: Bool
}

class EventTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateIntervalLabel: UILabel!
    @IBOutlet weak var isApplyableImageView: UIImageView!
    private var isApplyable = false {
        didSet {
            if isApplyable {
                isApplyableImageView.tintColor = Colors.greenColor.color
            } else {
                isApplyableImageView.tintColor = Colors.redColor.color
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        dateIntervalLabel.textColor = Colors.greyLabelColor.color
    }
    func configure(with config: EventTableViewCellConfig) {
        titleLabel.text = config.title
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        dateIntervalLabel.text = "\(dateFormatter.string(from: config.eventStart)) - \(dateFormatter.string(from: config.eventEnd))"
        isApplyable = config.isApplyable
    }
}

extension EventTableViewCell: NibLoadableView { }
