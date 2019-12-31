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
        case show
        case hide
        case done
        case cancel
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func show() {
        UIView.animate(withDuration: 0.5) {
            self.contentView?.alpha = 1
        }
    }

    func hide() {
        if !contentView.isHidden {
            UIView.animate(withDuration: 0.5) {
                self.contentView?.alpha = 0
            }
            contentView?.isUserInteractionEnabled = true
            contentView?.alpha = 0
        }
    }

    @IBAction private func doneAction(_ sender: Any) {
        hide()
        if let delegate = self.delegate {
            delegate.datePickerView(view: self, needPerform: .cancel, selectedDate: datePickerView.date)
        }
    }

    @IBAction private func cannelAction(_ sender: Any) {
        hide()
        if let delegate = self.delegate {
            delegate.datePickerView(view: self, needPerform: .done, selectedDate: nil)
        }
    }
}

