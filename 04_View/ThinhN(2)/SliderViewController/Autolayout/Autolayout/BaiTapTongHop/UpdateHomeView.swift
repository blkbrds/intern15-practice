//
//  SubView2.swift
//  Autolayout
//
//  Created by PCI0019 on 6/15/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit
protocol UpdateHomeViewDelegate: class {
    func sendDataToViewController(text: String, subView: UpdateHomeView)
}
protocol UpdateHomeViewDatasource: class {
    func getInformation(subView: UpdateHomeView) -> Information
    func getDataForPickerView(subView: UpdateHomeView) -> [String]
}
enum Information {
    case email
    case username
    case birthday
    case location
    case phone_number
    case job
    case password
    case confirm_password
    var placeholder: String {
        switch self {
        case .email:
            return "Email"
        case .username:
            return "Username"
        case .birthday:
            return "Birth day"
        case .location:
            return "Location"
        case .phone_number:
            return "Phone number"
        case .job:
            return "Job"
        case .password:
            return "Password"
        case .confirm_password:
            return "Confirm password "
        }
    }
    var iconImage: UIImage? {
        switch self {
        case .email:
            return UIImage(named: "email")
        case .username:
            return UIImage(named: "username")
        case .birthday:
            return UIImage(named: "birthday")
        case .location:
            return UIImage(named: "location")
        case .phone_number:
            return UIImage(named: "phone_number")
        case .job:
            return UIImage(named: "job")
        case .password:
            return UIImage(named: "password")
        case .confirm_password:
            return UIImage(named: "password")
        }
    }
}

class UpdateHomeView: UIView {
    
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var viewScript: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scriptTextField: UITextField!
    
    var pickerView = UIPickerView()
    var pickerData: [String] = []
    var datePicker =  UIDatePicker()
    
    weak var datasource: UpdateHomeViewDatasource? {
        didSet {
            setupView()
        }
    }
    weak var delegate: UpdateHomeViewDelegate?
    
    func configDatePicker() {
        datePicker.datePickerMode = .date
        scriptTextField.inputView = datePicker
        configToolBar()
    }
    
    func configToolBar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTouchUpInsine))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonTouchUpInsine))
        toolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        scriptTextField.inputAccessoryView = toolbar
    }
    
    @objc func doneButtonTouchUpInsine() {
        if scriptTextField.inputView == datePicker {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            scriptTextField.text = formatter.string(from: datePicker.date)
        }
        scriptTextField.resignFirstResponder()
    }
    @objc func cancelButtonTouchUpInsine() {
        scriptTextField.resignFirstResponder()
    }
    func configPasswordTextField() {
        scriptTextField.isSecureTextEntry = true
    }
    func configNumberKeyboard() {
        scriptTextField.keyboardType = .numberPad
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        xibSetup()
    }
    
    private func xibSetup() {
        let nib = UINib(nibName: "UpdateHomeView", bundle: .main)
        nib.instantiate(withOwner: self, options: nil)
        addSubview(containerView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        viewScript.layer.borderWidth = 0.5
        viewScript.layer.cornerRadius = 10
    }
    
    func setupView() {
        guard let datasource = datasource else { return }
        let info = datasource.getInformation(subView: self)
        pickerData = datasource.getDataForPickerView(subView: self)
        scriptTextField.placeholder = info.placeholder
        imageView.image = info.iconImage
        scriptTextField.delegate = self
        
        switch info {
        case .birthday:
            configDatePicker()
        case .password, .confirm_password:
            configPasswordTextField()
        case .phone_number:
            configNumberKeyboard()
        case .location, .job:
            scriptTextField.inputView = pickerView
            pickerView.delegate = self
            configToolBar()
        default:
            break
        }
    }
}

extension UpdateHomeView : UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        scriptTextField.text = pickerData[row]
    }
}

extension UpdateHomeView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let delegate = delegate, let text = scriptTextField.text else { return }
        delegate.sendDataToViewController(text: text, subView: self)
    }
}
