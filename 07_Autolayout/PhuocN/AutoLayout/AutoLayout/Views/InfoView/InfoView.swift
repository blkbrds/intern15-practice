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
        imageView.layer.cornerRadius = imageView.frame.height / 2
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
       
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}
