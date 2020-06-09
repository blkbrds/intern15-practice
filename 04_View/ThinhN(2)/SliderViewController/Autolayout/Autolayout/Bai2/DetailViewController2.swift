//
//  DetailViewController2.swift
//  Autolayout
//
//  Created by PCI0019 on 6/4/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol DetailViewControllerDelegate: class {
    func update(person: Person, viewController: DetailViewController2 )
}
class DetailViewController2: UIViewController {
    
    @IBOutlet weak var imageDetailView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var okButtonTouchUpInsine: UIButton!
    
    weak var delegate: DetailViewControllerDelegate?
    var person: Person = Person()
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
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTouchUpInsine))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonTouchUpInsine))
        toolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        dateOfBirthTextField.inputAccessoryView = toolbar
        dateOfBirthTextField.inputView = datePicker
    }
    @objc func doneButtonTouchUpInsine() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        dateOfBirthTextField.text = formatter.string(from: datePicker.date)
    
    }
    @objc func cancelButtonTouchUpInsine() {
     
    }
    
    @IBAction func okButtonTouchUpInsine(_ sender: Any) {
       
        let alert = UIAlertController(title: "Warning", message: "Do you want to edit this users with \(nameTextField.text!) and birth day \(datePicker.date)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in self.popViewController()}
        ))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func popViewController() {
        guard let delegate = delegate else {return}
               delegate.update(person: Person(name: nameTextField.text!, date: dateOfBirthTextField.text!), viewController: self)
        navigationController?.popViewController(animated: true)
    }
}
