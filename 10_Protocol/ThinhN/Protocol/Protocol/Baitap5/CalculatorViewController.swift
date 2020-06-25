//
//  CalculatorViewController.swift
//  Protocol
//
//  Created by PCI0019 on 6/25/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var operatorView: UIView!
    
    var calculator: CalculatorView?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

    }
    func setupView() {
        calculator = Bundle.main.loadNibNamed("CalculatorView", owner: self, options: nil)? [0] as? CalculatorView
        guard let calculator = calculator else {return}
        calculator.frame = CGRect(x: 0, y: 0, width: 400, height: 600)
        operatorView.addSubview(calculator)
    }
    
}

