//
//  Ex1ViewController.swift
//  AutoLayout
//
//  Created by PhuocNguyen on 10/9/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class Ex1ViewController: ExerciseViewController {
    
    // MARK: - Properties
    @IBOutlet weak var heightView: NSLayoutConstraint!
    @IBOutlet weak var heightEqualSuperView: NSLayoutConstraint!
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Action
    @IBAction func choiceExercise(_ sender: Any) {
        guard let control = sender as? UISegmentedControl else { return }
        switch control.selectedSegmentIndex {
        case 0:
            heightView.priority = UILayoutPriority(rawValue: 1000)
        default:
            heightView.priority = UILayoutPriority(rawValue: 998)
        }
    }
    
}
