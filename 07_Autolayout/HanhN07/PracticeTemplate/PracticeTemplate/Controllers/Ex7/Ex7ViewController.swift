<<<<<<< HEAD

import UIKit

final class Ex7ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func gotoEx7(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            let vc = Ex7_1ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            self.title = "Ex7_1"
        case 1:
            let vc = Ex7_2ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            self.title = "Ex7_2"
        case 2:
            let vc = Ex7_3ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            self.title = "Ex7_3"
        case 3:
            let vc = Ex7_4ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            self.title = "Ex7_4"
        case 4:
            let vc = Ex7_5ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            self.title = "Ex7_5"
        default:
            break
        }
    }
=======
//
//  Ex7ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex7ViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Ex7"
    }
    
    override func setupData() {
    }
    
    
>>>>>>> master
}
