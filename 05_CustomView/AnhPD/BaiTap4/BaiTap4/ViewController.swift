//
//  ViewController.swift
//  BaiTap4
//
//  Created by PCI0012 on 4/1/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DatePickerViewDelegate, UITextFieldDelegate {
    @IBOutlet weak var textFieldHienThi: UITextField!
    var datePicker : DatePickerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker = Bundle.main.loadNibNamed("DatePickerView", owner: self, options: nil)?.first as? DatePickerView
        datePicker?.hideDatePickker()
        datePicker?.delegate = self
        textFieldHienThi.delegate = self
        view.addSubview(datePicker!)
    }
    
    func chonNgayThangNam(date: Date?) {
        guard let date = date else {
            return
        }
        let dinhDangNgay = DateFormatter()
        dinhDangNgay.dateFormat = "MMMM dd yyyy"
        let dateString = dinhDangNgay.string(from: date)
        textFieldHienThi.text = dateString
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        datePicker?.showDatePick()
        view.endEditing(true)
    }
}
