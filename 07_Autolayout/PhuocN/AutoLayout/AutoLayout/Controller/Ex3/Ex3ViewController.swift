//
//  Ex3ViewController.swift
//  AutoLayout
//
//  Created by PhuocNguyen on 10/9/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class Ex3ViewController: ExerciseViewController {
    
    @IBOutlet weak var trailingWithSuperViewContrait: NSLayoutConstraint!
    @IBOutlet weak var leadingWithSuperViewContrait: NSLayoutConstraint!
    @IBOutlet weak var leadingWithHoziContraint: NSLayoutConstraint!
    @IBOutlet weak var trailingWithHoziContraint: NSLayoutConstraint!
    
    @IBOutlet weak var heightSquareContraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func choiceExercise(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            leadingWithHoziContraint.priority = UILayoutPriority(1000)
            trailingWithHoziContraint.priority = UILayoutPriority(1000)
            heightSquareContraint.priority = UILayoutPriority(1000)
        case 1:
            heightSquareContraint.priority = UILayoutPriority(1000)
            leadingWithHoziContraint.priority = UILayoutPriority(998)
            trailingWithHoziContraint.priority = UILayoutPriority(998)
            leadingWithSuperViewContrait.priority = UILayoutPriority(999)
            trailingWithSuperViewContrait.priority = UILayoutPriority(999)
        case 2:
            heightSquareContraint.priority = UILayoutPriority(rawValue: 997)
        default:
            break
        }
    }
}
