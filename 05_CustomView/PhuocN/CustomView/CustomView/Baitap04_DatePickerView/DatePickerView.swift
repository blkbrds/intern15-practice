//
//  DatePickerView.swift
//  CustomView
//
//  Created by PhuocNguyen on 10/7/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

protocol DatePickerViewDelegate: class {
  func selectDate(pickerView: DatePickerView,action: DatePickerView.Action,selectDate: Date?)
}
class DatePickerView: UIView {
  
  enum Action {
    case hide
    case show
    case done
    case cancel
  }
  
  weak var delegate: DatePickerViewDelegate?
  
  @IBOutlet weak var backgroundView: UIView!
  @IBOutlet weak var contentView: UIView!
  @IBOutlet weak var datePickerView: UIDatePicker!
  
  func config() {
    backgroundView.alpha = 0.5
    contentView.alpha = 1
    self.isHidden = true
  }
  
  func hide(animation: Bool) {
    if animation {
      UIView.animate(withDuration: 0.5, animations: {
        self.backgroundView.alpha = 0
        self.contentView.alpha = 0
      }) { (done) in
        self.isHidden = true
      }
    }else {
      backgroundView.alpha = 0
      self.contentView.alpha = 0
      self.isHidden = true
    }
  }
  
  func show(animation: Bool) {
    self.isHidden = false
    if animation {
      UIView.animate(withDuration: 0.5) {
        self.backgroundView.alpha = 0.5
        self.contentView.alpha = 1
      }
    }else {
      backgroundView.alpha = 0.5
      self.contentView.alpha = 1
    }
  }
  
  @IBAction func done(_ sender: Any) {
    hide(animation: true)
    guard let delegate = delegate else { return }
    delegate.selectDate(pickerView: self, action: .done, selectDate: datePickerView.date)
  }
  
  @IBAction func cancel(_ sender: Any) {
    hide(animation: true)
    guard let delegate = delegate else { return }
    delegate.selectDate(pickerView: self, action: .cancel, selectDate: nil)
  }
}

