//
//  App.swift
//  FinalProject
//
//  Created by Bien Le Q. on 8/26/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit
import SwiftUtils
import ObjectMapper

extension UIViewController {

    func alert(title: String? = nil,
               msg: String,
               buttons: [String] = ["OK"],
               preferButton: String = "",
               handler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        for button in buttons {
            let action = UIAlertAction(title: button, style: .default, handler: { action in
                handler?(action)
            })
            alert.addAction(action)

            // Bold button title
            if preferButton.isNotEmpty && preferButton == button {
                alert.preferredAction = action
            }
        }

        present(alert, animated: true, completion: nil)
    }
}
