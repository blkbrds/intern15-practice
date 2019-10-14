//
//  Ex13ViewController.swift
//  AutoLayout
//
//  Created by PhuocNguyen on 10/10/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class Ex13ViewController: ExerciseViewController {
  
    let rowColor: UIColor = UIColor(displayP3Red: 249/255, green: 246/255, blue: 238/255, alpha: 1)
    
    @IBOutlet weak var infoStackView: UIStackView!
    @IBOutlet weak var trailingEditButtonconstaint: NSLayoutConstraint!
    
    override func viewDidLoad() {
    super.viewDidLoad()
       
        infoStackView.distribution = .fillEqually
        for i in 0..<4 {
            let infoView = Bundle.main.loadNibNamed("InfoView", owner: self, options: nil)?.first as? InfoView
            if i % 2 == 0 {
                infoView?.backgroundColor = rowColor
            }else {
                infoView?.backgroundColor = UIColor.white
            }
            infoStackView.addArrangedSubview(infoView!)
        }
        setupNavi()
  }
    override func viewLayoutMarginsDidChange() {
        if UIScreen.main.bounds.width > 500 {
            trailingEditButtonconstaint.priority = UILayoutPriority.defaultLow
        }else {
            trailingEditButtonconstaint.priority = UILayoutPriority.required
        }
    }
  
  func setupNavi() {
   navigationController?.navigationBar.barTintColor = UIColor.red
    title = "Scheledule List"
    navigationItem.titleView?.tintColor = .white
    navigationController?.navigationBar.isTranslucent = false
  }
  
}

class CircleButton: UIButton {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.layer.cornerRadius = frame.height / 2
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    self.layer.cornerRadius = self.frame.height / 2
  }
}

class BorderButton: UIButton {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.layer.cornerRadius = 10
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    self.layer.cornerRadius = 10
  }
}
