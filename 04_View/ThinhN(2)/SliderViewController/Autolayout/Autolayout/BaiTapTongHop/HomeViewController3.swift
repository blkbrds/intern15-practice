//
//  HomeViewController3.swift
//  Autolayout
//
//  Created by PCI0019 on 6/15/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class HomeViewController3: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var arrInformation: [Information] = [.email, .username, .birthday, .location, .phone_number, .job, .password, .confirm_password]
    let countryArr = ["America", "China", "Japan", "Russian", "Vietnam"]
    let jobArr = ["Professor", "Teacher", "Student", "Other"]
    var datePicker = UIDatePicker()
    var pickerView1 = UIPickerView()
    var pickerView2 = UIPickerView()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var emailTextField: SubView2!
    @IBOutlet weak var usernameTextField: SubView2!
    @IBOutlet weak var birthdayTextField: SubView2!
    @IBOutlet weak var locationTextField: SubView2!
    @IBOutlet weak var phoneNumberTextField: SubView2!
    @IBOutlet weak var jobTextField: SubView2!
    @IBOutlet weak var passwordTextField: SubView2!
    @IBOutlet weak var confirmPasswordTextField: SubView2!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        showDatePicker()
        hiddenPassword()
        showNumber()
        locationTextField.scriptTextField.inputView = pickerView1
        jobTextField.scriptTextField.inputView = pickerView2
        emailTextField.datasource = self
        pickerView1.delegate = self
        pickerView2.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
           view.addGestureRecognizer(tap)
    }
   
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    func setUpView() {
//        emailTextField.text = "Email"
//        emailTextField.imageString = "email-1"
//        usernameTextField.text = "Username"
//        usernameTextField.imageString = "username"
//        birthdayTextField.text = "Birthday"
//        birthdayTextField.imageString = "birthday"
//        locationTextField.text = "Location"
//        locationTextField.imageString = "location"
//        phoneNumberTextField.text = "Phone number"
//        phoneNumberTextField.imageString = "phone_number"
//        jobTextField.text = "Job"
//        jobTextField.imageString = "job"
//        passwordTextField.text = "Password"
//        passwordTextField.imageString = "password"
//        confirmPasswordTextField.text = "Confirm password"
//        confirmPasswordTextField.imageString = "password"
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryArr.count
    }

    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryArr[row]
    }

    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        locationTextField.text = countryArr[row]
    }
              
      
    func showDatePicker() {
        datePicker.datePickerMode = .date
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTouchUpInsine))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonTouchUpInsine))
        toolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        birthdayTextField.scriptTextField.inputAccessoryView = toolbar
        birthdayTextField.scriptTextField.inputView = datePicker
    }
    @objc func doneButtonTouchUpInsine() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        birthdayTextField.text = formatter.string(from: datePicker.date)
    }
    @objc func cancelButtonTouchUpInsine() {
    }
   
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//       return 1
//    }
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//       return dataArray.count
//    }
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//       let row = dataArray[row]
//        locationTextField.scriptTextField.inputView = pickerView1
//       return row
//    }
    func hiddenPassword() {
        passwordTextField.scriptTextField.isSecureTextEntry = true
        confirmPasswordTextField.scriptTextField.isSecureTextEntry = true
    }
    func showNumber() {
        phoneNumberTextField.scriptTextField.keyboardType = .numberPad
    }
    
    @objc func action() {
          view.endEditing(true)
    }
}


extension HomeViewController3: SubView2Datasource {
    func passDataToViewController(viewController: SubView2) -> [Information] {
        return arrInformation
    }
    
    
}
