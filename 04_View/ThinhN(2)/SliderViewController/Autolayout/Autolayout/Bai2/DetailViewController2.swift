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
    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBOutlet weak var okButtonTouchUpInsine: UIButton!
    weak var delegate: DetailDelegate?
    
    var person: Person = Person()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        setupView()
        dateOfBirthTextField.delegate = self
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
        datePickerView.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
    }
    @objc func dateChanged(_ sender: UIDatePicker) {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: sender.date)
        if let day = components.day, let month = components.month, let year = components.year {
            print("\(day) \(month) \(year)")
        }
    }
    @IBAction func buttonTouchUpInsine(_ sender: Any) {
        if let delegate = delegate,
            let name = nameTextField.text,
            let date = dateOfBirthTextField.text {
            delegate.passData(name: name, date: date)
        }
        let alert = UIAlertController(title: "Warning", message: "Do you want to edit this users with \(nameTextField.text!) and birth day \(datePickerView.date)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in self.data()}
        ))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func data() {
        
        let vc = HomeView2Controller()
        
        navigationController?.pushViewController(vc, animated: true)
       
    }
}
extension DetailViewController2: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        datePickerView.isHidden = false
    }
}

