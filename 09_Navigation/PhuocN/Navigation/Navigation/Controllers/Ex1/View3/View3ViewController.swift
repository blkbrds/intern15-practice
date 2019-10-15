//
//  View4ViewController.swift
//  Navigation
//
//  Created by PhuocNguyen on 10/15/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class View3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View 3"
    }
    
    @IBAction func pushToNextView() {
        let vc = View4ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func popToPreView() {
         navigationController?.popViewController(animated: true)
    }
    
    @IBAction func popToRootView() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func popToView1() {
        for vc in navigationController!.viewControllers {
            if let vc = vc as? View1ViewController {
                navigationController?.popToViewController(vc, animated: true)
                return
            }
        }
    }

}
