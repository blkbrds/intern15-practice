//
//  DetailViewController2.swift
//  Autolayout
//
//  Created by PCI0019 on 6/4/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol DetailDelegate: class {
    func update(person: Person, index: Int)
}
class DetailViewController2: UIViewController {
    
    @IBOutlet weak var imageDetailView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var okButtonTouchUpInsine: UIButton!
    
    weak var delegate: DetailDelegate?
    var person: Person = Person()
    var index: Int = 0
    var datePicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        setupView()
        showDatePicker()
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
    func showDatePicker() {
        datePicker.datePickerMode = .date
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneDatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
        toolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        dateOfBirthTextField.inputAccessoryView = toolbar
        dateOfBirthTextField.inputView = datePicker
    }
    @objc func doneDatePicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        dateOfBirthTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    @objc func cancelDatePicker() {
        self.view.endEditing(true)
    }
    
    @IBAction func okButtonTouchUpInsine(_ sender: Any) {
        delegate?.update(person: Person(name: nameTextField.text!, date: dateOfBirthTextField.text!), index: index)
        let alert = UIAlertController(title: "Warning", message: "Do you want to edit this users with \(nameTextField.text!) and birth day \(datePicker.date)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in self.giveValue()}
        ))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func giveValue() {
        navigationController?.popViewController(animated: true)
    }
}
