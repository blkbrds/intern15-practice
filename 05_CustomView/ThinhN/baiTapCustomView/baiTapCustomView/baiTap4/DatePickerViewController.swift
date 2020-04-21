//
//  DatePickerViewController.swift
//  baiTapCustomView
//
//  Created by ADMIN on 4/21/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

final class DatePickerViewController: UIViewController {

    @IBOutlet weak var dateTextField: UITextField!

    private var datePickerView: DatePickerView?
    override func viewDidLoad() {
        super.viewDidLoad()
        datePickerView = Bundle.main.loadNibNamed("DatePickerView", owner: self, options: nil)?.first as? DatePickerView
        datePickerView?.delegate = self
        view.addSubview(datePickerView!)
        dateTextField.delegate = self
    }
}
extension DatePickerViewController: DatePickerViewDelegate {
    func selectDate(selectDate: Date?) {
        guard let date = selectDate else { return }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        let dateString = dateFormatter.string(from: date)
        dateTextField.text = dateString
    }
}
extension DatePickerViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        datePickerView?.showContent()
        view.endEditing(true)
    }
}
