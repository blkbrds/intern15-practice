//
//  SliderViewController.swift
//  CustomView
//
//  Created by PhuocNguyen on 10/7/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {
  
  @IBOutlet weak var valueTF: UITextField!
  var value: Int = 0 {
    didSet {
      valueTF.text = String(value)
    }
  }
  
  let slider = SliderView(frame: CGRect(x: 170, y: 100, width: 50, height: 390))
  override func viewDidLoad() {
    super.viewDidLoad()
    valueTF.text = String(value)
    valueTF.delegate = self
    slider.frame.size = CGSize(width: 50, height: 400)
    slider.center = view.center
    slider.delegate = self
    self.view.addSubview(slider)
  }
  
  @IBAction func changValue(_ sender: Any) {
    guard let text = valueTF.text else { return }
    guard let value = Int(text) else { return }
    self.value = value
    slider.isChange = false
    slider.value = CGFloat(value)
  }
  
  @objc func tap() {
    print("tap")
  }
  
}

extension SliderViewController: SliderViewDelegate {
  func changeValue(value: CGFloat) {
    self.value = Int(value)
  }
}

extension SliderViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}
