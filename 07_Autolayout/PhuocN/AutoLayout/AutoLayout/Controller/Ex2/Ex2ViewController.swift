//
//  Ex2ViewController.swift
//  AutoLayout
//
//  Created by PhuocNguyen on 10/9/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class Ex2ViewController: ExerciseViewController {
    
    //MARK: - Properties
    @IBOutlet private weak var topLayoutContraint: NSLayoutConstraint!
    @IBOutlet private weak var bottomLayoutContraint: NSLayoutConstraint!
    
    //MARK: -life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Action
    @IBAction func choiceExercise(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            topLayoutContraint.priority = UILayoutPriority(rawValue: 1000)
            bottomLayoutContraint.priority = UILayoutPriority(rawValue: 1000)
        default:
            topLayoutContraint.priority = UILayoutPriority(rawValue: 998)
            bottomLayoutContraint.priority = UILayoutPriority(rawValue: 998)
        }
    }
}
