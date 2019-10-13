//
//  ExerciseViewController.swift
//  AutoLayout
//
//  Created by PhuocNguyen on 10/9/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class ExerciseViewController: BaseViewController {
    
    //MARK: - Properties
    var exercise: Exercise?
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - config
    override func setupUI() {
        self.title = exercise?.name
    }
    
}
