<<<<<<< HEAD

import UIKit

final class Ex5ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Ex4"
    }

    @IBAction func gotoEx5_4(_ sender: Any) {
        let vc = Ex5_4ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        self.title = "EX4_4"
    }

    @IBAction func gotoEx5_2(_ sender: Any) {
        let vc = Ex5_2ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        self.title = "EX4_2"
    }
    @IBAction func gotoEx5_3(_ sender: Any) {
        let vc = Ex5_3ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        self.title = "EX4_3"
    }
    @IBAction func gotoEx5_5(_ sender: Any) {
        let vc = Ex5_5ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        self.title = "EX4_5"
    }
=======
//
//  Ex5ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex5ViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Ex5"
    }
    
    override func setupData() {
    }
    
    
>>>>>>> master
}
