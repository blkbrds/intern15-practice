//
//  SubView2.swift
//  Autolayout
//
//  Created by PCI0019 on 6/15/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol SubView2Datasource: class {
    func passDataToViewController(script: Information, viewController: SubView2) 
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
}

class SubView2: UIView {
    
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var viewScript: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scriptTextField: UITextField!
    
    var text: String = ""
    var imageString: String = ""
    weak var datasource: SubView2Datasource?
    
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
    override func layoutSubviews() {
        super.layoutSubviews()
        viewScript.layer.cornerRadius = 10
        scriptTextField.layer.cornerRadius = 10
        scriptTextField.placeholder = text
        imageView.image = UIImage(named: imageString)
    }
    func setupView() {
       
    }
}

