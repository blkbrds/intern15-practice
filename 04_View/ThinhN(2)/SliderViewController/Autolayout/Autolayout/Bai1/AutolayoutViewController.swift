//
//  AutolayoutViewController.swift
//  Autolayout
//
//  Created by PCI0019 on 6/3/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class AutolayoutViewController: UIViewController {
    
   
    @IBOutlet weak var hiddenView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        setupView()
        super.viewDidLoad()
    }
    
    func setupView() {
        
        cancelButton.layer.cornerRadius = 15
        goButton.layer.cornerRadius = 15
        subView.layer.cornerRadius = 15
        blueView.layer.cornerRadius = 2
    }

    @IBAction func popButtonTouchUpInsine(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[0])!
        self.navigationController?.popToViewController(vc, animated: true)
    }
}
