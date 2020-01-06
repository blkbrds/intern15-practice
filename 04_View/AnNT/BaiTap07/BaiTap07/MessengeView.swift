//
//  MessengeView.swift
//  BaiTap07
//
//  Created by An Nguyễn on 12/25/19.
//  Copyright © 2019 An Nguyễn. All rights reserved.
//

import UIKit

class MessengeView: UIImageView {

    var messengeLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    private func setupUI() {
        self.image = UIImage(named: "messenge")
        messengeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        messengeLabel.center = self.center
        messengeLabel.layer.position.y -= 10
        messengeLabel.textAlignment = .center
        messengeLabel.textColor = .white
        messengeLabel.text = ""
        self.addSubview(messengeLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
