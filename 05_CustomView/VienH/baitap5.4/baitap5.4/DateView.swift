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

    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBOutlet weak var contentView: UIView!

    enum Action {
        case show
        case hide
        case done
        case cancel

    }
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

    @IBAction func cannelAction(_ sender: Any) {
        hide()

        if let delegate = self.delegate {
            delegate.datePickerView(view: self, needPerform: .done, selectedDate: nil)
        }
    }
}

