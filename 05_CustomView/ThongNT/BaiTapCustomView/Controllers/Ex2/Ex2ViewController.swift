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
    let triangleView = MySliderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        valueTextField.text = "0 %"
        let frame = CGRect(x: 182, y: 170, width: 50, height: 550)
        triangleView.delegate = self
        triangleView.frame = frame
        triangleView.backgroundColor = .white
        view.addSubview(triangleView)
        
        let avatarView = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?[0] as? MySliderView
        view.addSubview(avatarView!)
        
        
        valueTextField.text = "0 %"
        //valueTextField.delegate = self
        valueTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension Ex2ViewController: MySliderViewDelegate{
    func mySliderView(mySliderView: MySliderView, valueOfTextField: Int) {
        valueTextField.text = "\(valueOfTextField) %"
    }
}
