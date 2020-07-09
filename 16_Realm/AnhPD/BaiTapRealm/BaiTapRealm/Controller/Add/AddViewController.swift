//
//  AddViewController.swift
//  BaiTapRealm
//
//  Created by PCI0012 on 6/22/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

protocol AddViewControllerDelegate: class {
    func addInfo(view: AddViewController, id: Int, title: String, subTiTle: String)
}

class AddViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var subTitleTextField: UITextField!
    @IBOutlet weak var idLabel: UILabel!
    
    weak var delegate: AddViewControllerDelegate?
    var id: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigation()
        title = "Add Information"
        idLabel.text = String(id)
        // Do any additional setup after loading the view.
    }
    
    private func configNavigation() {
        let back = UIBarButtonItem(image: #imageLiteral(resourceName: "ic-back"), style: .plain, target: self, action: #selector(backTouchUpInSide))
        navigationItem.leftBarButtonItem = back
        navigationController?.navigationBar.tintColor = .black
    }
    
    @objc func backTouchUpInSide() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func addButtonTouchUpInSide(_ sender: Any) {
        if let delegate = delegate {
            delegate.addInfo(view: self, id: Int(idLabel.text ?? "0") ?? 0, title: titleTextField.text ?? "", subTiTle: subTitleTextField.text ?? "")
        }
    }
}
