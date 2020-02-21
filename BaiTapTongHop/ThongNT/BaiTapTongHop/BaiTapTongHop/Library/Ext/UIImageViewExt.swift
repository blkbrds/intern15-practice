//
//  UIImageViewExt.swift
//  BaiTapTongHop
//
//  Created by PCI0018 on 12/18/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    
  func setImageWithPath(urlString: String?, placeholder: String? = nil) {
    var placeholderImage: UIImage?
    if let placeholder = placeholder, let image = UIImage(named: placeholder) {
      placeholderImage = image
    } else {
      placeholderImage = UIColor.white.image()
    }
    guard let urlString = urlString, let url = URL(string: urlString) else {
      image = placeholderImage
      return
    }
    sd_setImage(with: url, placeholderImage: placeholderImage)
  }
}
