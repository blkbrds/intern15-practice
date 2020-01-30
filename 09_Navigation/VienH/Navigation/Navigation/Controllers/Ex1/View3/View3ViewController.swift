//
//  View3ViewController.swift
//  Navigation
//
//  Created by user on 12/10/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

final class View3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View 3"
    }

    @IBAction private func pushToNextScreen() {
        let vc = View4ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction private func popToPreviousScreen() {
        navigationController?.popViewController(animated: true)
    }

    @IBAction private func popToHome(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }

    @IBAction private func popToPreviousFirstScreen() {
        guard let navi = navigationController else { return }
        for vc in navi.viewControllers {
            if let vc = vc as? View1ViewController {
                navi.popToViewController(vc, animated: true)
                return
            }
        }
    }
}