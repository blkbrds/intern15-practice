//
//  MySliderViewController.swift
//  baiTapCustomView
//
//  Created by ADMIN on 3/27/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

final class MySliderViewController: UIViewController {
    
    @IBOutlet weak private var valueTextField: UITextField!
    private var value: Int = 50 {
        didSet{
            valueTextField.text = String(value)
        }
    }
    private let mySliderView = MySliderView(frame: CGRect(x: 170, y: 100, width: 50, height: 400))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        valueTextField.text = String(value)
        valueTextField.delegate = self
        mySliderView.frame.size = CGSize(width: 50, height: 400)
        mySliderView.center = view.center
        mySliderView.delegate = self
        view.addSubview(mySliderView)
    }
    
    @IBAction private func changeValue(_ sender: Any) {
        guard let text = valueTextField.text, let value = Int(text) else { return }
        self.value  = value
        mySliderView.isChange = false
        mySliderView.value = CGFloat(value)
    }
}
extension MySliderViewController: MySliderViewDelegate {
    func changeValue(value: CGFloat, view: MySliderView) {
         self.value = Int(value)
    }
}
extension MySliderViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
