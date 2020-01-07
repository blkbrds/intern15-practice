//
//  SliderCollectionViewCell.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class SliderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak private var imageCollection: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateSliderView(image: String?) {
        imageCollection.image = UIImage(named: image!)
    }
}
