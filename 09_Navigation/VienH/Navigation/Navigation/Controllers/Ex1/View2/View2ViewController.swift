//
//  View2ViewController.swift
//  Navigation
//
//  Created by user on 12/10/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

class View2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View 2"
        
    }
    
    @IBAction func pushToNextButton() {
        let vc = View3ViewController()
        navigationController?.pushViewController(vc, animated: true)
        }
    
    @IBAction func pushToPreviousButton() {
    navigationController?.popViewController(animated: true)
    }
    
    @IBAction func pushToRootButton() {
        navigationController?.popToRootViewController(animated: true)
    }
}
