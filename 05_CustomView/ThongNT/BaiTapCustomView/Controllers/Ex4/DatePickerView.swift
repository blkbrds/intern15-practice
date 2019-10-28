//
//  DatePickerView.swift
//  BaiTapCustomView
//
//  Created by PCI0018 on 10/17/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

protocol DatePickerViewDelegate {
    func datePickerView (view: DatePickerView, needPerform  : DatePickerView.Action, selectedDate: Date?)
}

final class DatePickerView: UIView {

    enum Action {
        case show
        case hide
        case done
        case cancel
    }

    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var datePickerView: UIDatePicker!

    var delegate: DatePickerViewDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        contentView?.alpha = 0
    }

    //MARK: - public functions
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
        }
    }

    // MARK: - Action
    @IBAction func doneAction(_ sender: Any) {
        hide()
        if let delegate = self.delegate {
            delegate.datePickerView(view: self, needPerform: .cancel, selectedDate: datePickerView.date)
        }
    }

    @IBAction func cancelAction(_ sender: Any) {
        hide()
        if let delegate = self.delegate {
            delegate.datePickerView(view: self, needPerform: .done, selectedDate: nil)
        }
    }
}
