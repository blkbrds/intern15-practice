//
//  SliderViewController.swift
//  CustomView
//
//  Created by PhuocNguyen on 10/7/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

final class SliderViewController: UIViewController {
    
    @IBOutlet weak private var valueTextField: UITextField!
    
    private var value: Int = 0 {
        didSet {
            valueTextField.text = String(value)
        }
    }
    
    private let sliderView = SliderView(frame: CGRect(x: 170, y: 100, width: 50, height: 390))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        valueTextField.text = String(value)
        valueTextField.delegate = self
        sliderView.frame.size = CGSize(width: 50, height: 400)
        sliderView.center = view.center
        sliderView.delegate = self
        self.view.addSubview(sliderView)
    }
    
    @IBAction func changValue(_ sender: Any) {
        guard let text = valueTextField.text, let value = Int(text) else { return }
        self.value = value
        sliderView.isChange = false
        sliderView.value = CGFloat(value)
    }
}

extension SliderViewController: SliderViewDelegate {
    func changeValue(value: CGFloat) {
        self.value = Int(value)
    }
}

extension SliderViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
