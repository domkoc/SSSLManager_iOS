//
//  UITableViewExtension.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 13..
//

import Foundation
import UIKit

extension UITableView {
    func registerCell<T: UITableViewCell>(_: T.Type) where T: NibLoadableView {
      let nib = UINib(nibName: T.nibName, bundle: nil)
      register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    func dequeueReusableCell<T: UITableViewCell>() -> T {
      guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T else {
        fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
      }
      return cell
    }

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
      guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else {
        fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier) for index path row: \(indexPath.row)")
      }
      return cell
    }
}
