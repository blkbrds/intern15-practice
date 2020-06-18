//
//  HomeViewController3.swift
//  Autolayout
//
//  Created by PCI0019 on 6/15/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class HomeViewController3: UIViewController {
    var arrInformation: [Information] = [.email, .username, .birthday, .location, .phone_number, .job, .password, .confirm_password]
    let countryArr = ["America", "China", "Japan", "Russian", "Vietnam"]
    let jobArr = ["Professor", "Teacher", "Student", "Other"]
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var subViews: [SubView2]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for view in subViews {
            view.datasource = self
            view.delegate = self
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
//    func showDatePicker() {
//        datePicker.datePickerMode = .date
//        let toolbar = UIToolbar()
//        toolbar.sizeToFit()
//        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTouchUpInsine))
//        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
//        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonTouchUpInsine))
//        toolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
//        birthdayTextField.scriptTextField.inputAccessoryView = toolbar
//        birthdayTextField.scriptTextField.inputView = datePicker
//
//    }
//    @objc func doneButtonTouchUpInsine() {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd/MM/yyyy"
//        birthdayTextField.scriptTextField.text = formatter.string(from: datePicker.date)
//    }
//    @objc func cancelButtonTouchUpInsine() {
//    }
//    func hiddenPassword() {
//        passwordTextField.scriptTextField.isSecureTextEntry = true
//        confirmPasswordTextField.scriptTextField.isSecureTextEntry = true
//    }
//    func showNumber() {
//        phoneNumberTextField.scriptTextField.keyboardType = .numberPad
//    }
//
    @objc func action() {
        view.endEditing(true)
    }
    
    @IBAction func resignButtonTouchUpInsine(_ sender: Any) {
        
    }
    
}

extension HomeViewController3: SubView2Datasource {
    func getDataForPickerView(subView: SubView2) -> [String] {
        switch arrInformation[subView.tag] {
        case .location:
            return countryArr
        case .job:
            return jobArr
        default:
            return []
        }
    }
    func passDataToViewController(subView: SubView2) -> Information {
        let name = arrInformation[subView.tag]
        return name
    }
}

extension HomeViewController3: SubView2Delegate {
    func sendDataToViewController(subView: SubView2) {
        
    }
}
