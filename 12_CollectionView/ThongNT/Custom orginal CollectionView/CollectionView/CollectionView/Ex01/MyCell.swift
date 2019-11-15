//
//  MyCell.swift
//  CollectionView
//
//  Created by PCI0018 on 11/15/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

final class MyCell: UICollectionViewCell {
    let textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        textLabel.frame = bounds
        addSubview(textLabel)
    }
}
