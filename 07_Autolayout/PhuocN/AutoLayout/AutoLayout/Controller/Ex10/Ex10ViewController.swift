//
//  Ex10ViewController.swift
//  AutoLayout
//
//  Created by PhuocNguyen on 10/10/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class Ex10ViewController: ExerciseViewController {
    
    //MARK: - Properties
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet var heightContraintLayout: [NSLayoutConstraint]!
    // [view1.height, view2.height, view3.height, view4.height]
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view1.isUserInteractionEnabled = true
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(tapView1(_:)))
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(tapView2(_:)))
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(tapView3(_:)))
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(tapView4(_:)))
        view1.addGestureRecognizer(tapGesture1)
        view2.addGestureRecognizer(tapGesture2)
        view3.addGestureRecognizer(tapGesture3)
        view4.addGestureRecognizer(tapGesture4)
    }
    
    @objc func tapView1(_ sender: UITapGestureRecognizer) {
        self.heightContraintLayout[0].constant = 128
        self.heightContraintLayout[1].constant = 64
        self.heightContraintLayout[2].constant = 64
        self.heightContraintLayout[3].constant = 64
    }
    
    @objc func tapView2(_ sender: UITapGestureRecognizer) {
        self.heightContraintLayout[0].constant = 64
        self.heightContraintLayout[1].constant = 128
        self.heightContraintLayout[2].constant = 64
        self.heightContraintLayout[3].constant = 64
    }
    
    @objc func tapView3(_ sender: UITapGestureRecognizer) {
        self.heightContraintLayout[0].constant = 64
        self.heightContraintLayout[1].constant = 64
        self.heightContraintLayout[2].constant = 128
        self.heightContraintLayout[3].constant = 64
        UIView.animate(withDuration: 1) {
            self.setNeedsFocusUpdate()
        }
    }
    
    @objc func tapView4(_ sender: UITapGestureRecognizer) {
        self.heightContraintLayout[0].constant = 64
        self.heightContraintLayout[1].constant = 64
        self.heightContraintLayout[2].constant = 64
        self.heightContraintLayout[3].constant = 128
    }
    
}
