//
//  HomeViewController.swift
//  BaiTap5Protocol
//
//  Created by Sếp Quân on 3/31/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var number1TextField: UITextField!
    @IBOutlet private weak var number2TextField: UITextField!
    @IBOutlet private weak var operatorButton: UIButton!
    @IBOutlet private weak var resultLabel: UILabel!
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Function
    private func setupView() {
        number1TextField.layer.borderWidth = 2
        number1TextField.layer.borderColor = UIColor.green.cgColor
        number1TextField.layer.cornerRadius = 8
        number1TextField.clipsToBounds = true
        number2TextField.layer.borderWidth = 2
        number2TextField.layer.borderColor = UIColor.green.cgColor
        number2TextField.layer.cornerRadius = 8
        number2TextField.clipsToBounds = true
        operatorButton.layer.cornerRadius = 8
        operatorButton.clipsToBounds = true
        operatorButton.layer.borderWidth = 2
        operatorButton.layer.borderColor = UIColor.black.cgColor
    }
    
    // MARK: - IBAction
    @IBAction private func operatorTouchUpInside(_ sender: UIButton) {
        guard let customView = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as? CustomView else {
            return
        }
        customView.frame = CGRect(x: 0, y: 200, width: 414, height: 350)
        customView.dataSource = self
        customView.loadXY()
        customView.delegate = self
        view.addSubview(customView)
    }
}

// MARK: - Extension
extension HomeViewController: CustomViewDataSource {
    func getValueX() -> Int? {
        guard let x = number1TextField.text else {
            return 0
        }
        return Int(x)
    }
    
    func getValueY() -> Int? {
        guard let y = number2TextField.text else {
            return 0
        }
        return Int(y)
    }
}

extension HomeViewController: CustomViewDelegate {
    func clear() {
        number1TextField.text = ""
        number2TextField.text = ""
        resultLabel.text = ""
    }
    
    func done(result: String) {
        resultLabel.text = result
    }
}
