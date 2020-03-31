//
//  DatePickerViewController.swift
//  baiTapCustomView
//
//  Created by ADMIN on 3/30/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

final class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePickerTextField: UITextField!
    
    var datePickerView: DatePickerView?
    override func viewDidLoad() {
        datePickerView = Bundle.main.loadNibNamed("DatePickerView", owner: self, options: nil)?.first as? DatePickerView
        datePickerView?.setUI()
        datePickerView?.delegate = self
        view.addSubview(datePickerView!)
        datePickerTextField.delegate = self
    }
}
extension DatePickerViewController: DatePickerViewDelegate{
    func valueDate(pickerView: DatePickerView, action: DatePickerView.Action, select: Date?) {
        guard let date = select else { return }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        let dateString = dateFormatter.string(from: date)
        datePickerTextField.text = dateString
    }
}
extension DatePickerViewController: UITextFieldDelegate {
  func textFieldDidBeginEditing(_ textField: UITextField) {
    datePickerView?.show(animation: true)
    view.endEditing(true)
  }
}
