//
//  AvatarView.swift
//  BaiTap3
//
//  Created by PCI0012 on 4/28/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit
protocol AvatarViewDelegate {
    func tap(userName: String, nameImageView: String)
}

class AvatarView: UIView {
    
    var nameImageView: String = "M10"
    var userName: String = ""
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var userNameLabel: UILabel!
    
    var delegate: AvatarViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateView() {
        userNameLabel.text = userName
    }
    
    @IBAction func profileButtonTouchUpInSide(_ sender: Any) {
        delegate?.tap(userName: userName, nameImageView: nameImageView)
    }
}
