//
//  View4ViewController.swift
//  Navigation
//
//  Created by user on 12/10/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

final class View4ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View 4"
    }

    @IBAction private func pushToPreviousView1Button(_ sender: Any) {
        guard let navi = navigationController else { return }
        for vc in navi.viewControllers {
            if let vc = vc as? View1ViewController {
                navi.popToViewController(vc, animated: true)
                return
            }
        }
    }

    @IBAction private func pushToPreviousView2Button(_ sender: Any) {
        guard let navi = navigationController else { return }
        for vc in navi.viewControllers {
            if let vc = vc as? View2ViewController {
                navi.popToViewController(vc, animated: true)
                return
            }
        }
    }

    @IBAction private func pushToPreviousView3Button(_ sender: Any) {
        guard let navi = navigationController else { return }
        for vc in navi.viewControllers {
            if let vc = vc as? View3ViewController {
                navi.popToViewController(vc, animated: true)
                return
            }
        }
    }

    @IBAction private func popToRootButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
