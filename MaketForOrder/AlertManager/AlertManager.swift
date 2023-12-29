//
//  AlertManager.swift
//  MaketForOrder
//
//  Created by Ratibor on 29.12.2023.
//

import UIKit

class AlertManager {
    static func showAlert(title: String, message: String, viewController: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
        viewController.present(alert, animated: true, completion: nil)
    }
}
