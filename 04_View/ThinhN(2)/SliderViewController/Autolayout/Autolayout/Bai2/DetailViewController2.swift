//
//  DetailViewController2.swift
//  Autolayout
//
//  Created by PCI0019 on 6/4/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol DetailDelegate: class {
    func passData(name: String,date: String)
}

class DetailViewController2: UIViewController {
    
    @IBOutlet weak var imageDetailView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    
    weak var delegate: DetailDelegate?

    var person: Person = Person()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        setupView()
        
    }
    func setupView() {
        imageDetailView.layer.cornerRadius = 50
        imageDetailView.layer.borderWidth = 1
        imageDetailView.clipsToBounds = true
        nameTextField.layer.cornerRadius = 15
        nameTextField.layer.borderWidth = 1
        nameTextField.clipsToBounds = true
        dateOfBirthTextField.clipsToBounds = true
        dateOfBirthTextField.layer.borderWidth = 1
        dateOfBirthTextField.layer.cornerRadius = 15
        nameTextField.text = person.name
        dateOfBirthTextField.text = person.date
    }
    @IBAction func buttonTouchUpInsine(_ sender: Any) {
        if let delegate = delegate,
            let name = nameTextField.text,
            let date = dateOfBirthTextField.text {
            delegate.passData(name: name, date: date)
        }
    }
}
