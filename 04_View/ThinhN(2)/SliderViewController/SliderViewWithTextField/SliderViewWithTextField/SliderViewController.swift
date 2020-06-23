//
//  SliderViewController.swift
//  SliderViewWithTextField
//
//  Created by PCI0019 on 6/2/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {
    
    @IBOutlet weak var valueTextFiled: UITextField!
    
    var sliderView: SliderView?
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderView = (Bundle.main.loadNibNamed("SliderView", owner: self, options: nil)? [0] as? SliderView)
        guard let sliderView = sliderView else { return }
        sliderView.delegate = self
        sliderView.frame = CGRect(x: 200, y: 200, width: 40, height: 500)
        view.addSubview(sliderView)
    }
    
    @IBAction func okButtonTouchUpInside(_ sender: Any) {
        guard let valueTextField = valueTextFiled.text, let value = Int(valueTextField) else { return }
        sliderView?.getValue(value: value)
    }
}
extension SliderViewController: UserViewDelegate {
    func didTap(view: SliderView, count: Int) {
        valueTextFiled.text = String(count)
    }
}
