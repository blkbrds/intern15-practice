//
//  CustomView.swift
//  BaiTapCusTomCell
//
//  Created by PCI0012 on 5/22/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit
protocol CustomViewDelegate: class {
    func customView(view: CustomView, avatar: String, nameTitle: String, address: String)
}
class CustomView: UIView {

    @IBOutlet weak var avatarTextField: UITextField!
    @IBOutlet weak var nameTitleTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var avatar: String = ""
    var nameTitle: String = ""
    var address: String = ""
    weak var delegate: CustomViewDelegate?
    
    @IBOutlet weak var okButton: UIButton!
    
    func updateData() {
        
    }
    
    func configButton() {
        okButton.layer.cornerRadius = 10
        okButton.clipsToBounds = true
    }
    
    @IBAction func okButtonTouchUpInSide(_ sender: Any) {
        if let delegate = delegate {
            delegate.customView(view: self, avatar: avatarTextField.text ?? "", nameTitle: nameTitleTextField.text ?? "", address: addressTextField.text ?? "")
        }
    }
    
}
