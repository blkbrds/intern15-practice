//
//  EViewController.swift
//  PracticeTemplate
//
//  Created by ANH NGUYỄN on 11/2/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

final class EViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func convertCviewButton(_ sender: Any) {
        guard let navigation = navigationController else {return}
        for vc in navigation.viewControllers {
            if let vc = vc as? CViewController {
                navigationController?.popToViewController(vc, animated: true)
            }
        }
    }
    
    @IBAction func convertBViewButton(_ sender: Any) {
        guard let navigation = navigationController else {return}
        for vc in navigation.viewControllers {
            if let vc = vc as? BViewController {
                navigationController?.popToViewController(vc, animated: true)
            }
        }
    }
    
    @IBAction func convertDviewButton(_ sender: Any) {
        guard let navigation = navigationController else {return}
        for vc in navigation.viewControllers {
            if let vc = vc as? DViewController {
                navigationController?.popToViewController(vc, animated: true)
            }
        }
    }
    
    @IBAction func rootButton(_ sender: Any) {
        guard let navigation = navigationController else {return}
        for vc in navigation.viewControllers {
            if let vc = vc as? Ex1ViewController {
                navigationController?.popToViewController(vc, animated: true)
            }
        }
    }
}
