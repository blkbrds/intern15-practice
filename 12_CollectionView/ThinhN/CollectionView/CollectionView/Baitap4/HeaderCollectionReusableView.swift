//
//  HeaderCollectionReusableView.swift
//  CollectionView
//
//  Created by PCI0019 on 7/3/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var listCell: UICollectionView!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
