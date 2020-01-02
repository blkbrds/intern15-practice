//
//  DateView.swift
//  baitap5.4
//
//  Created by user on 11/21/19.
//  Copyright © 2019 VienH. All rights reserved.
//
import UIKit

protocol DatePickerViewDelegate {
    func datePickerView (view: DateView, needPerform: DateView.Action, selectedDate: Date?)
}

final class DateView: UIView {

    var delegate: DatePickerViewDelegate?

    @IBOutlet private weak var datePickerView: UIDatePicker!
    @IBOutlet private weak var contentView: UIView!

    enum Action {
        case showPickerView
        case hidePickerView
        case donePickerView
        case cancelPickerView
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func showPickerView() {
        UIView.animate(withDuration: 0.5) {
            self.contentView?.alpha = 1
        }
    }

    func hidePickerView() {
        if !contentView.isHidden {
            UIView.animate(withDuration: 0.5) {
                self.contentView?.alpha = 0
            }
            contentView?.isUserInteractionEnabled = true
            contentView?.alpha = 0
        }
    }

    @IBAction private func doneButtonAction(_ sender: Any) {
        hidePickerView()
        if let delegate = self.delegate {
            delegate.datePickerView(view: self, needPerform: .cancelPickerView, selectedDate: datePickerView.date)
        }
    }

    @IBAction private func datePickerChanged(_ sender: Any) {
        hidePickerView()
        if let delegate = self.delegate {
            delegate.datePickerView(view: self, needPerform: .donePickerView, selectedDate: nil)
        }
    }
}

