//
//  NibLoadableView.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 13..
//

import Foundation
import UIKit

public protocol NibLoadableView: class {}

public extension NibLoadableView where Self: UIView {
  static var nibName: String {
    return String(describing: self)
  }
    static func loadFromNib() -> Self {
        guard let nibLoadableView = UINib(nibName: self.nibName, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? Self else {
            fatalError("Could not instantiate View with nib name: \(nibName)")
        }
        return nibLoadableView
    }

    static func loadFromNib(instantiateWithOwner ownerOrNil: Any?) -> Self {
        guard let nibLoadableView = UINib(nibName: nibName, bundle: nil).instantiate(withOwner: ownerOrNil, options: nil)[0] as? Self else {
            fatalError("Could not instantiate View with nib name: \(nibName)")
        }
        return nibLoadableView
    }
}

