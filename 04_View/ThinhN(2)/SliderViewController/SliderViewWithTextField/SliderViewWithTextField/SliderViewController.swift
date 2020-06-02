//
//  SliderViewController.swift
//  SliderViewWithTextField
//
//  Created by PCI0019 on 6/2/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol SliderViewControllerDelegate: class {
    func sendValue(view: SliderViewController, value: Int)
    
}

class SliderViewController: UIViewController {

    @IBOutlet weak var valueTextFiled: UITextField!
    var value = 0
    var delegate: SliderViewControllerDelegate?
 
    override func viewDidLoad() {
        super.viewDidLoad()
       if let sliderView = Bundle.main.loadNibNamed ("SliderView", owner: self, options: nil )? [0] as? SliderView {
        sliderView.delegate = self
        sliderView.frame = CGRect(x: 200, y: 200, width: 40, height: 500)
        view.addSubview(sliderView)
        }
    }
    
    @IBAction func okButtonTouchUpInsine(_ sender: Any) {
        if let valueTextField = valueTextFiled.text {
            value = Int(valueTextField) ?? 0
        }
        if let delegate = delegate {
            delegate.sendValue(view: self, value: value)
        }
    }

}

extension SliderViewController: UserViewDelegate {
    func didTap(view: SliderView, count: Int) {
        valueTextFiled.text = String(count)
        
    }
}
