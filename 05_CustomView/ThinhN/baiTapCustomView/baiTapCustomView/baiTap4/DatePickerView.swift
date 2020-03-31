//
//  DatePickerView.swift
//  baiTapCustomView
//
//  Created by ADMIN on 3/30/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

protocol DatePickerViewDelegate: class {
    func valueDate(pickerView: DatePickerView, action: DatePickerView.Action, select: Date?)

}
class DatePickerView: UIView{
    enum Action{
        case hide
        case show
        case done
    }
    
    weak var delegate: DatePickerViewDelegate?
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBOutlet weak var contentView: UIView!

    func setUI(){
        backgroundView.alpha = 0.5
        contentView.alpha = 1
        isHidden = true
    }
    func hide(animation: Bool){
        if animation{
            UIView.animate(withDuration: 0.5, animations: {
                self.backgroundView.alpha = 0
                self.contentView.alpha = 0
            }) {(done) in
                self.isHidden = true
            }
        } else {
            backgroundView.alpha = 0
            contentView.alpha = 0
            isHidden = true
        }
    }
    func show(animation: Bool){
        self.isHidden = true
        if animation{
            UIView.animate(withDuration: 0.5) {
                self.backgroundView.alpha = 0.5
                self.contentView.alpha = 1
            }
        } else {
            backgroundView.alpha = 1
            contentView.alpha = 1
        }
    }
    @IBAction func doneButton(_ sender: Any) {
        hide(animation: true)
        guard let delegate = delegate else {
            return }
        delegate.valueDate(pickerView: self, action: .done, select: datePickerView.date)
    }
}
