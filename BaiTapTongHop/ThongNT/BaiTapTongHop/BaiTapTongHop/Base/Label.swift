//
//  App.swift
//  FinalProject
//
//  Created by Bien Le Q. on 8/26/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit
import MVVM

class Label: UILabel, MVVM.View {

    private var isLocalized = false
    private(set) var originText: String?

    override func awakeFromNib() {
        super.awakeFromNib()
        originText = text
        text = originText
    }

    override var text: String? {
        didSet {
            if !isLocalized {
                isLocalized = true
                originText = text
                text = originText?.localized()
            }
            isLocalized = false
        }
    }
}
