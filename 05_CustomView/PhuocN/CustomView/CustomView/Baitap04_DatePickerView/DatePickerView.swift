//
//  DatePickerView.swift
//  CustomView
//
//  Created by PhuocNguyen on 10/7/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

protocol DatePickerViewDelegate: class {
  func selectDate(date: Date)
}

class DatePickerView: UIView {
  
  weak var delegate: DatePickerViewDelegate?
  let datePickerView = UIDatePicker()
  let button = UIButton()
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.layer.borderColor = UIColor.black.cgColor
    self.layer.borderWidth = 1
    setupButton()
    setupDatePickerView()
  }
  
  func setupButton() {
    button.backgroundColor = .systemGroupedBackground
    button.setTitle("Done", for: .normal)
    button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    button.setTitleColor(.systemBlue, for: .normal)
    button.contentHorizontalAlignment = .left
    button.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 50)
    button.addTarget(self, action: #selector(selectPickerView), for: .touchUpInside)
    self.addSubview(button)
  }
  
  func setupDatePickerView() {
    datePickerView.datePickerMode = .date
    datePickerView.backgroundColor = .lightGray
    datePickerView.contentMode = .scaleToFill
    datePickerView.frame = CGRect(x: 0, y: 50, width: self.frame.width, height: self.frame.height - 50)
    self.addSubview(datePickerView)
  }
  
  @objc func selectPickerView() {
    delegate?.selectDate(date: datePickerView.date)
    UIView.animate(withDuration: 0.5) {
      self.alpha = 0
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

