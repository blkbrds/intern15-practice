//
//  ViewController.swift
//  BaiTap04
//
//  Created by An Nguyễn on 12/27/19.
//  Copyright © 2019 An Nguyễn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var datePickerView:DatePickerView!
    var dateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupUI()
        datePickerView?.delegate = self
    }
    
    private func setupUI(){
        datePickerView = DatePickerView(frame: CGRect(x: 0, y: self.view.bounds.height - 300, width: self.view.bounds.width, height: 300))
        view.addSubview(datePickerView)
        dateButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 45))
        dateButton.layer.borderColor = UIColor.gray.cgColor
        dateButton.layer.borderWidth = 1
        dateButton.layer.cornerRadius = 5
        dateButton.center = view.center
        dateButton.setTitleColor(.black, for: .normal)
        dateButton.setTitle("Show", for: .normal)
        dateButton.addTarget(self, action: #selector(handleShowDatePicker), for: .touchUpInside)
        view.addSubview(dateButton)
    }
    
    @objc func handleShowDatePicker(){
        guard self.datePickerView.frame.maxY >= self.view.bounds.height else {
            return
        }
        UIView.animate(withDuration: 1) {
            self.datePickerView.isHidden = false
            self.datePickerView.frame.origin.y = self.view.bounds.height - 300
        }
    }
}

extension ViewController: DatePickerViewDelegate {
    func valueChanged(view: DatePickerView, value: Date) {
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .medium
        let dateStr = dateFormater.string(from: value)
        dateButton.setTitle(dateStr, for: .normal)
    }
}

