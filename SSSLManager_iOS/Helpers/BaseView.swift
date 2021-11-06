//
//  BaseView.swift
//  SSSLManager_iOS
//
//  Created by Kocka Dominik Csaba on 2021. 11. 06..
//

import Foundation
import UIKit

protocol BaseView: AnyObject {
    func showAlert(title: String, message: String, handler: ((UIAlertAction) -> Void)?)
    func showSuccessAlert(message: String, handler: ((UIAlertAction) -> Void)?)
    func showErrorAlert(message: String, handler: ((UIAlertAction) -> Void)?)
    func startLoading()
    func stopLoading()
}

extension BaseView where Self: UIViewController { }

extension UIViewController: BaseView {
    func showAlert(title: String, message: String, handler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: UIAlertAction.Style.default,
                                      handler: handler))
        self.present(alert,
                     animated: true,
                     completion: nil)
    }
    func showSuccessAlert(message: String, handler: ((UIAlertAction) -> Void)?) {
        showAlert(title: "Success", message: message, handler: handler)
    }
    func showErrorAlert(message: String, handler: ((UIAlertAction) -> Void)?) {
        showAlert(title: "Error", message: message, handler: handler)
    }
    func startLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    func stopLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
