//
//  CustomView.swift
//  BaiTap5Protocol
//
//  Created by Sếp Quân on 3/31/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

protocol CustomViewDelegate: class {
    func clear()
    func done(result: String)
}

protocol CustomViewDataSource: class {
    func getValueX() -> Int?
    func getValueY() -> Int?
}

final class CustomView: UIView {
    // MARK: - IBOutlet
    @IBOutlet private weak var yLabel: UILabel!
    @IBOutlet private weak var xLabel: UILabel!
    @IBOutlet private weak var resultLabel: UILabel!
    
    // MARK: - Properties
    private var result: Int?
    weak var delegate: CustomViewDelegate?
    weak var dataSource: CustomViewDataSource?
    
    // MARK: - IBAction
    @IBAction private func operatorsTouchUpInside(_ sender: UIButton) {
        guard let x = dataSource?.getValueX(), let y = dataSource?.getValueY() else {
            return
        }
        switch sender.tag {
        case 0:
            result = x + y
        case 1:
            result = x - y
        case 2:
            result = x * y
        case 3:
            result = y == 0 ? nil : x / y
        case 4:
            result = y == 0 ? nil : x % y
        default:
            result = Int(pow(Double(x), Double(y)))
        }
        guard let result = self.result else { return }
        resultLabel.text = String(result)
    }
    
    @IBAction private func cancelTouchUpInside(_ sender: UIBarButtonItem) {
        UIView.animate(withDuration: 2, animations: {
            self.isHidden = true
        })
    }
    
    @IBAction private func doneTouchUpInside(_ sender: UIBarButtonItem) {
        UIView.animate(withDuration: 2, animations: {
            self.isHidden = true
        })
        guard let result = self.result else { return }
        if let delegate = self.delegate {
            delegate.done(result: String(result))
        }
    }
    @IBAction private func clearTouchUpInside(_ sender: UIButton) {
        UIView.animate(withDuration: 2, animations: {
            self.isHidden = true
        })
        if let delegate = self.delegate {
            delegate.clear()
        }
    }
    
    // MARK: - Function
    func loadXY() {
        guard let x = dataSource?.getValueX(), let y = dataSource?.getValueY() else {
            return
        }
        xLabel.text = String(x)
        yLabel.text = String(y)
    }
}
