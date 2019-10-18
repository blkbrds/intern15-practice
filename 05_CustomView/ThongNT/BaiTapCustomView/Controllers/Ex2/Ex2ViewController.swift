//
//  Ex2ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

final class Ex2ViewController: BaseViewController {

    @IBOutlet private weak var valueLabel: UILabel!
    @IBOutlet private weak var valueTextField: UITextField!

    private let triangle = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?[0] as? MySliderView

    override func viewDidLoad() {
        super.viewDidLoad()
        valueTextField.text = "0 %"
        valueTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)

        if let triangle = triangle {
            let frame = CGRect(x: 180, y: 230, width: 50, height: 400)
            triangle.frame = frame
            triangle.delegate = self
            view.addSubview(triangle)
        }
    }

    @objc func textFieldDidChange(textField: UITextField) {
        guard let valueString = valueTextField.text, let int = Int(valueString) else { return }
        triangle?.receiveValue = int
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension Ex2ViewController: MySliderViewDelegate {

    func mySliderView(view: MySliderView, needPerform action: MySliderView.Action) {
        switch action {
        case .sendValue(let x):
            valueTextField.text = "\(x) %"
        }
    }
}
