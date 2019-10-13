//
//  Ex13ViewController.swift
//  AutoLayout
//
//  Created by PhuocNguyen on 10/10/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class Ex13ViewController: ExerciseViewController {
  
    @IBOutlet weak var trailingEditButtonconstaint: NSLayoutConstraint!
    override func viewDidLoad() {
    super.viewDidLoad()
        
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
    //fatalError("init(coder:) has not been implemented")
  }
}

class CircleImage: UIImageView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.layer.cornerRadius = self.frame.height / 2
    self.layer.borderColor = UIColor(displayP3Red: 241/255, green: 196/255, blue: 15/255, alpha: 1).cgColor
    self.layer.borderWidth = 5
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    self.layer.cornerRadius = self.frame.height / 2
    self.layer.borderColor = UIColor(displayP3Red: 241/255, green: 196/255, blue: 15/255, alpha: 1).cgColor
    self.layer.borderWidth = 5
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
