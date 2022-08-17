//
//  UIViewControllerExtension.swift
//  EmbibeDemo
//
//  Created by Admin on 8/16/22.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title: String, message: String, completion: @escaping (UIAlertAction) -> Void) {
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: completion))

        self.present(alertController, animated: true, completion: nil)
    }
}
