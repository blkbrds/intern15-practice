<<<<<<< HEAD

import UIKit

final class Ex6ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        super.title = "Ex5"
    }
    @IBAction func gotoEx6_1(_ sender: Any) {
        let vc = Ex6_1ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        self.title = "EX5_1"
    }

    @IBAction func gotoEx6_2(_ sender: Any) {
        let vc = Ex6_2ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        self.title = "EX5_2"
    }
    @IBAction func gotoEx6_3(_ sender: Any) {
        let vc = Ex6_3ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        self.title = "EX5_3"
    }
    @IBAction func gotoEx6_4(_ sender: Any) {
        let vc = Ex6_4ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        self.title = "EX5_4"
    }
    @IBAction func gotoEx6_5(_ sender: Any) {
        let vc = Ex6_5ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        self.title = "EX5_5"
    }
=======
//
//  Ex6ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex6ViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Ex6"
    }
    
    override func setupData() {
    }
    
    
>>>>>>> master
}
