<<<<<<< HEAD

import UIKit

final class Ex1ViewController: BaseViewController {

    var exercise: Exercise?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
=======
//
//  Ex1ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex1ViewController: BaseViewController {
    
    var exercise: Exercise?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: config
>>>>>>> master
    override func setupUI() {
        super.setupUI()
        self.title = exercise?.name
    }
<<<<<<< HEAD
    override func setupData() {
    }
=======
    
    override func setupData() {
    }
    
    
>>>>>>> master
}
