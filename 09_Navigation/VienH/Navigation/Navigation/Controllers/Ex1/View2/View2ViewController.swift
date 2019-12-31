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

    @IBAction private func pushToNextButton() {
        let vc = View3ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction private func pushToPreviousButton() {
        navigationController?.popViewController(animated: true)
    }

    @IBAction private func pushToRootButton() {
        navigationController?.popToRootViewController(animated: true)
    }
}
