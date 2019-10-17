//
//  Ex2ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex2ViewController: BaseViewController {
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var valueTextField: UITextField!
    let triangle = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?[0] as? MySliderView

    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect(x: 180, y: 230, width: 50, height: 400)
        triangle?.frame = frame
        triangle?.delegate = self
        view.addSubview(triangle!)
        
        valueTextField.text = "0 %"
        valueTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        guard let int = Int(valueTextField.text!) else { return }
        triangle?.receiveValue = int
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension Ex2ViewController: MySliderViewDelegate{
    func sendValue(value: Int) {
        valueTextField.text = "\(value) %"
    }
}
