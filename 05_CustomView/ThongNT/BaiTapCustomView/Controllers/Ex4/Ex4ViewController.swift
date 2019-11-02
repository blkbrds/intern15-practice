//
//  Ex4ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

final class Ex4ViewController: BaseViewController {
    @IBOutlet private weak var showDateTextField: UITextField!

    private var dateView = Bundle.main.loadNibNamed("DatePickerView", owner: self, options: nil)?.first as? DatePickerView

    override func viewDidLoad() {
        super.viewDidLoad()

        showDateTextField.delegate = self
        showDateTextField.layer.borderColor = UIColor.black.cgColor
        showDateTextField.layer.borderWidth = 0.5
        showDateTextField.layer.cornerRadius = 5

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

extension Ex4ViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        dateView?.show()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        dateView?.hide()
    }
}

extension Ex4ViewController: DatePickerViewDelegate {

    func datePickerView(view: DatePickerView, needPerform: DatePickerView.Action, selectedDate: Date?) {
        if let selectedDate = selectedDate {
            let formatedDate = DateFormatter()
            formatedDate.dateFormat = "MM - dd - YYYY"
            let dateString = formatedDate.string(from: selectedDate)
            showDateTextField.text = dateString
        }
    }
}
