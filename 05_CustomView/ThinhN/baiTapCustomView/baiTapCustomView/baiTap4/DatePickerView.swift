//
//  DatePickerView.swift
//  baiTapCustomView
//
//  Created by ADMIN on 4/21/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

protocol DatePickerViewDelegate: DatePickerViewController {
    func valueDate(pickerView: DatePickerView, select: Date?)
}
class DatePickerView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
   weak var delegate: DatePickerViewDelegate?
   func showContent(){
       self.isHidden = false
       UIView.animate(withDuration: 0.5, animations: {
           self.contentView.alpha = 1
       })
   }
    @IBAction private func doneTouchUpInsine(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {self.contentView.alpha = 0})
        {(done) in
            self.isHidden = true
        }
        guard let delegate = delegate else {return}
        delegate.valueDate(pickerView: datePicker.date, select: )
    }
}
