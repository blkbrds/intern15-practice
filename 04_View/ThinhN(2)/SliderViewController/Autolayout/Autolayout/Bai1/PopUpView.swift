//
//  PopUpView.swift
//  Autolayout
//
//  Created by PCI0019 on 6/4/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol PopUpDelegate: class {
    func passValueToViewController(view: PopUpView)
}

class PopUpView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var viewPopUp: UIView!
    
    weak var delegate: PopUpDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    func setupView() {
        viewPopUp.layer.cornerRadius = 10
        goButton.layer.cornerRadius = 10
        cancelButton.layer.cornerRadius = 10
        imageView.layer.cornerRadius = 10 
    }
    @IBAction func goButtonTouchUpInsine(_ sender: Any) {
        delegate?.passValueToViewController(view: self)
    }
}
