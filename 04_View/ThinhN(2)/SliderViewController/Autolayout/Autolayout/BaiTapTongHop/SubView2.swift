//
//  SubView2.swift
//  Autolayout
//
//  Created by PCI0019 on 6/15/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit
protocol SubView2Delegate: class {
    func sendDataToViewController(subView: SubView2)
}
protocol SubView2Datasource: class {
    func passDataToViewController(subView: SubView2) -> Information
    func getDataForPickerView(subView: SubView2) -> [String]
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
    var value: String {
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
    var iconView: UIImage? {
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
            return UIImage(named: "confirm_password")
        }
    }
}

class SubView2: UIView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var viewScript: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scriptTextField: UITextField!
    
    var keyBoard: [String] = []
    var text: String = ""
    var imageString: String = ""
    weak var datasource: SubView2Datasource? {
        didSet {
            setupView()
        }
    }
    weak var delegate: SubView2Delegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        xibSetup()
    }
   
    
    private func xibSetup() {
        let nib = UINib(nibName: "SubView2", bundle: .main)
        nib.instantiate(withOwner: self, options: nil)
        addSubview(containerView)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return keyBoard.count
    }

    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return keyBoard[row]
    }

    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        scriptTextField.text = keyBoard[row]
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        viewScript.layer.cornerRadius = 10
        scriptTextField.layer.cornerRadius = 10
       
    }
    func setupView() {
        guard let datasource = datasource else { return }
        let info = datasource.passDataToViewController(subView: self)
        let showPicker = datasource.getDataForPickerView(subView: self)
        scriptTextField.placeholder = info.value
        imageView.image = info.iconView
        keyBoard = showPicker
    }
}

