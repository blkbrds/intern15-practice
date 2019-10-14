//
//  InfoView.swift
//  AutoLayout
//
//  Created by PhuocNguyen on 10/13/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class InfoView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layer.cornerRadius = self.imageView.frame.width / 2
        imageView.layer.borderColor = UIColor.yellow.cgColor
        imageView.layer.borderWidth = 3
    }
}
