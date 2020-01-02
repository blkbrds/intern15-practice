//
//  DateViewController.swift
//  baitap5.4
//
//  Created by user on 11/21/19.
//  Copyright © 2019 VienH. All rights reserved.
//
import UIKit

final class DateViewController: UIViewController {

    @IBOutlet private weak var showDateTextfield: UITextField!

    private var dateView = Bundle.main.loadNibNamed("DateView", owner: self, options: nil)?.first as? DateView

    override func viewDidLoad() {
        super.viewDidLoad()

        showDateTextfield.delegate = self
        showDateTextfield.layer.borderColor = UIColor.black.cgColor
        showDateTextfield.layer.borderWidth = 0.5
        showDateTextfield.layer.cornerRadius = 5

        if let dateView = dateView {
            let frame = CGRect(x: 0, y: view.frame.maxY - dateView.frame.height, width: view.frame.width, height: dateView.frame.height)
            dateView.frame = frame
            dateView.delegate = self
            view.addSubview(dateView)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension DateViewController: UITextFieldDelegate {

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        dateView?.showPickerView()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        dateView?.hidePickerView()
    }
}

extension DateViewController: DatePickerViewDelegate {

    func datePickerView(view: DateView, needPerform: DateView.Action, selectedDate: Date?) {
        if let selectedDate = selectedDate {
            let formatedDate = DateFormatter()
            formatedDate.dateFormat = "MM - dd - YYYY"
            let dateString = formatedDate.string(from: selectedDate)
            showDateTextfield.text = dateString
        }
    }
}

