//
//  HomeViewController.swift
//  Baitap05
//
//  Created by PCI0008 on 1/10/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var xTextField: UITextField!
    @IBOutlet weak var yTextField: UITextField!
    
    var selectView = SelectView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        selectView = Bundle.main.loadNibNamed("SelectView", owner: self, options: nil)?[0] as! SelectView
        selectView.frame = CGRect(x: 0, y: 900, width: view.bounds.width, height: 200)
        view.addSubview(selectView)
        selectView.isHidden = true
        selectView.dataSource = self
    }
    
    @IBAction private func touchUpInsideShowButton(_ sender: Any) {
        selectView.delegate = self
        selectView.configData()
        selectView.showViewWithAnimation()
    }
}

extension UIView {
    func showViewWithAnimation(){
        UIView.animate(withDuration: 3, delay: 0, options: [.curveEaseIn],
                       animations: {
                        self.center.y -= self.bounds.height * 3 / 2
        }, completion: nil)
        self.isHidden = false
    }
    
    func hideViewWithAnimation(){
        UIView.animate(withDuration: 3, delay: 0, options: [.curveLinear],
                       animations: {
                        self.center.y += self.bounds.height * 3 / 2
        },  completion: {(_ completed: Bool) -> Void in
        self.isHidden = true
            })
    }
}

extension HomeViewController: SelectViewDataSource {
    func passTheNumbers(for view: UIView) -> (a: Int, b: Int) {
        guard let xText = xTextField.text, let xNumber = Int(xText), let yText = yTextField.text, let yNumber = Int(yText) else { return (0, 0) }
        return (xNumber, yNumber)
    }
}

extension HomeViewController: SelectViewDelegate {
    func view(view: SelectView, needPerform acion: SelectView.Action) {
        switch acion {
        case .clearDataOfTextFields:
            xTextField.text?.removeAll()
            yTextField.text?.removeAll()
        }
    }
}
