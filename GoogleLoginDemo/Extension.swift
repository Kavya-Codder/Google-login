//
//  Extension.swift
//  GoogleLoginDemo
//
//  Created by Sunil Developer on 07/02/23.
//

import Foundation
import UIKit
extension UIViewController {
func showAlert(title: String, message: String, hendler: ((UIAlertAction) -> Swift.Void)? = nil) {
    let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "ok", style: .default , handler: hendler)
    alertVC.addAction(action)
    self.present(alertVC, animated: true, completion: nil)
}
}
