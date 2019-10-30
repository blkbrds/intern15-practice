//
//  ImageViewExt.swift
//  DemoAPIYoutube
//
//  Created by PhuocNguyen on 10/30/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit



extension UIImageView {
    
    func setImageWith(urlString: String, placeHolder: String? = nil, index: Int) {
        if let placeHolder = placeHolder, let plimage = UIImage(named: placeHolder) {
            image = plimage
        } else {
            image = nil
        }
        ApiManager.Downloader.downloadImage(imageURL: urlString, index: index) { (image, index) in
            self.image = image
        }
    }
}
