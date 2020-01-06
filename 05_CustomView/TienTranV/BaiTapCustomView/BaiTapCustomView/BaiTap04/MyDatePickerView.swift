//
//  MyDatePickerView.swift
//  BaiTapCustomView
//
//  Created by TranVanTien on 11/18/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

protocol MyDatePickerViewDelegate: class {
    func sendDateValue(view: MyDatePickerView, needsPerform action: MyDatePickerView.Action)
}

final class MyDatePickerView: UIView {

    enum Action {
        case sendDate(date: String)
    }

    @IBOutlet private weak var doneButton: UIButton!
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var datePicker: UIDatePicker!

    weak var delegate: MyDatePickerViewDelegate?
    private var date: String?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {
        Bundle.main.loadNibNamed("MyDatePickerView", owner: self, options: nil)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(contentView)
    }

    func hide() {
        UIView.animate(withDuration: 0.5, animations: {
            self.contentView.alpha = 0
        }) { (done) in
            if done {
                self.contentView.isHidden = true
            }
        }
    }

    func show() {
        UIView.animate(withDuration: 0.5, animations: {
            self.contentView.alpha = 1
        }) { (done) in
            if done {
                self.contentView.isHidden = false
            }
        }
    }

    @IBAction private func doneButtonAction(_ sender: Any) {
        guard let dateString = date else { return }
        delegate?.sendDateValue(view: self, needsPerform: .sendDate(date: dateString))
    }

    @IBAction private func datePickerChanged(_ sender: Any) {
        let dateFormatter = DateFormatter()

        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short

        date = dateFormatter.string(from: datePicker.date)
    }
}
