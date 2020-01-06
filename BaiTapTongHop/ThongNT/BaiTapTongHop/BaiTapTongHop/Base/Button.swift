//
//  App.swift
//  FinalProject
//
//  Created by Bien Le Q. on 8/26/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit
import MVVM

class Button: UIButton, MVVM.View {

    // MARK: - Construction

    convenience init() {
        self.init(frame: .zero)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        tintColor = .black
        isExclusiveTouch = true
    }

    convenience init(customType: UIButton.ButtonType) {
        self.init(type: customType)
        tintColor = .black
        isExclusiveTouch = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        tintColor = .black
        isExclusiveTouch = true
    }

    // MARK: - Life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        tintColor = .black
        isExclusiveTouch = true
    }

    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        UIGraphicsBeginImageContext(Config.imageContextSize)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(color.cgColor)
        context.fill(Config.contextRect)
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        setBackgroundImage(colorImage, for: state)
    }
}

// MARK: - Definition

extension Button {

    struct Config {
        static let imageContextSize = CGSize(width: 1, height: 1)
        static let contextRect = CGRect(x: 0, y: 0, width: 1, height: 1)
    }
}
