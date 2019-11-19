//
//  MySlider.swift
//  BaiTapCustomView
//
//  Created by TranVanTien on 11/16/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

protocol MySliderViewDelegate: class {
    func mySlider(mySlider: MySliderView, needPerform action: MySliderView.Action)
}

protocol MySliderViewDatasource: class {
    func getValue(mySlider: MySliderView) -> Int
}

final class MySliderView: UIView {

    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var thumbNailLabel: UILabel!
    @IBOutlet private weak var colorImageView: UIImageView!

    enum Action {
        case getPercent(Int)
    }

    weak var delegate: MySliderViewDelegate?
    weak var datasource: MySliderViewDatasource?

    override func awakeFromNib() {
        setupUI()
    }

    private func setupUI() {
        Bundle.main.loadNibNamed("MySlider", owner: self, options: nil)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(contentView)
    }

    func updateUI() {
        guard let getValuePercent = datasource?.getValue(mySlider: self) else { return }

        let thumbNailLabelHeight = contentView.frame.maxY - CGFloat(getValuePercent) * 340 / 100 - 20
        thumbNailLabel.center = CGPoint(x: contentView.center.x, y: thumbNailLabelHeight)

        colorImageView.frame = CGRect(x: contentView.frame.minX, y: thumbNailLabel.center.y, width: contentView.frame.width, height: contentView.frame.maxY - thumbNailLabel.center.y)

        thumbNailLabel.text = "\(getValuePercent)"
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)

        if let touch = touches.first {
            let position = touch.location(in: self.contentView)
            if position.x >= thumbNailLabel.frame.minX,
                position.x <= thumbNailLabel.frame.maxX,
                position.y >= thumbNailLabel.frame.minY,
                position.y <= thumbNailLabel.frame.maxY,
                position.y >= contentView.frame.minY + 20,
                position.y <= contentView.frame.maxY - 20 {

                thumbNailLabel.center = CGPoint(x: contentView.center.x, y: position.y)

                colorImageView.frame = CGRect(x: contentView.frame.minX, y: thumbNailLabel.center.y, width: contentView.frame.width, height: contentView.frame.maxY - thumbNailLabel.center.y)

                let a = colorImageView.frame.height - 20
                let b: CGFloat = 340
                let percentSlider = 100 * a / b

                thumbNailLabel.text = "\(Int(percentSlider))"
                delegate?.mySlider(mySlider: self, needPerform: Action.getPercent(Int(percentSlider)))
            }
        }
    }
}
