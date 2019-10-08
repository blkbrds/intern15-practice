//
//  DatePickerViewController.swift
//  CustomView
//
//  Created by PhuocNguyen on 10/7/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

  @IBOutlet weak var dateTextField: UITextField!
  var datePickerView = DatePickerView()
  
  override func viewDidLoad() {
        super.viewDidLoad()
    datePickerView = DatePickerView(frame: CGRect(x: 0, y: 500, width: UIScreen.main.bounds.width, height: 300))
    datePickerView.delegate = self
    datePickerView.alpha = 0
    datePickerView.isHidden = true
    self.view.addSubview(datePickerView)
    dateTextField.delegate = self
  }
}

extension DatePickerViewController: DatePickerViewDelegate {
  func selectDate(date: Date) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMMM dd, yyyy"
    let dateString = dateFormatter.string(from: date)
    self.dateTextField.text = dateString
  }
}

extension DatePickerViewController: UITextFieldDelegate {
  func textFieldDidBeginEditing(_ textField: UITextField) {
    view.endEditing(true)
    datePickerView.isHidden = false
    UIView.animate(withDuration: 0.5) {
      self.datePickerView.alpha = 1
    }
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    datePickerView.isHidden = false
    UIView.animate(withDuration: 0.5) {
      self.datePickerView.alpha = 1
    }
    return true
  }
}
