//
//  SliderViewController.swift
//  baitap5.2
//
//  Created by user on 11/20/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {

    @IBOutlet weak var valueTextfield: UITextField!
    @IBOutlet weak var labelController: UILabel!

    private let triangle = Bundle.main.loadNibNamed("SliderView", owner: self, options: nil)?[0] as? SliderView

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        valueTextfield.text = "0 %"

        if let triangle = triangle {
            let frame = CGRect(x: view.bounds.width / 2 - 50, y: 200, width: 100, height: 400)
            triangle.frame = frame
            triangle.delegate = self
            view.addSubview(triangle)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension SliderViewController: MySliderViewDelegate {

    func mySliderView(view: SliderView, needPerform action: SliderView.Action) {
        switch action {
        case .sendValue(let x):
            valueTextfield.text = "\(x) %"
        }
    }
}

