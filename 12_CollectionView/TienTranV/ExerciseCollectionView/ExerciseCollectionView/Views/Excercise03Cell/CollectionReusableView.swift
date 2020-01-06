//
//  CollectionReusableView.swift
//  ExerciseCollectionView
//
//  Created by PCI0002 on 12/10/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class CollectionReusableView: UICollectionReusableView {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var nameHeader: UILabel!
    
    // MARK: - Properties
    typealias GetName = () -> String
    
    // MARK: - Public funcs
    func configUI(getName: GetName) {
        let name = getName()
        nameHeader.text = name
    }
}
