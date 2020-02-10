//
//  View2ViewController.swift
//  Navigation
//
//  Created by user on 12/10/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

final class View2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View 2"
    }

    @IBAction private func pushToNextScreen() {
        let vc = View3ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction private func popToPreviousScreen() {
        navigationController?.popViewController(animated: true)
    }

    @IBAction private func popToHome() {
        navigationController?.popToRootViewController(animated: true)
    }
}
