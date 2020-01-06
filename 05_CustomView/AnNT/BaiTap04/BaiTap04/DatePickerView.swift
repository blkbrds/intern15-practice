//
//  DatePickerView.swift
//  BaiTap04
//
//  Created by An Nguyễn on 12/27/19.
//  Copyright © 2019 An Nguyễn. All rights reserved.
//

import UIKit

protocol DatePickerViewDelegate: class {
    func valueChanged(view: DatePickerView, value: Date)
}

final class DatePickerView: UIView {
    
    weak var delegate: DatePickerViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    private func setupView(){
        self.backgroundColor = .gray
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 40, width: self.bounds.width, height: self.bounds.height - 40))
        datePicker.addTarget(self, action: #selector(handlevalueChanged), for: .valueChanged)
        let doneButton = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 40))
        doneButton.setTitle("Done", for: .normal)
        doneButton.setTitleColor(.blue, for: .normal)
        doneButton.addTarget(self, action: #selector(handleHidenDatePicker), for: .touchUpInside)
        self.addSubview(doneButton)
        self.addSubview(datePicker)
    }
    
    @objc func handleHidenDatePicker(sender: UIButton) {
        UIView.animate(withDuration: 1, animations: {
            self.frame.origin.y += self.bounds.height
        }, completion: { (_) in
            self.isHidden = true
        })
    }
    
    @objc func handlevalueChanged(_ sender: UIDatePicker){
        let date = sender.date
        delegate?.valueChanged(view: self, value: date)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
