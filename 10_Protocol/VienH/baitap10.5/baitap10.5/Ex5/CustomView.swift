//
//  CustomView.swift
//  baitap10.5
//
//  Created by user on 12/17/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

protocol CustomViewDataSource: class {
    func getValues() -> (x: Int, y: Int)
}

protocol CustomViewDelegate: class {
    func sendResult(view: CustomView, needsPerfrom action: CustomView.Action)
}

final class CustomView: UIView {

    @IBOutlet weak var xLabel: UILabel!
    
    @IBOutlet weak var yLabel: UILabel!
    
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    // MARK: - Enum
    enum Action {
        case cancel
        case clear
        case sendResult(result: Float)
    }

    enum CalculateAction: Int {
        case plus
        case substract
        case mutiply
        case divide
        case modulo
        case exponential
        case clear
    }

    private var x: Int = 0
    private var y: Int = 0
    private var result: Float = 0

    weak var dataSource: CustomViewDataSource?
    weak var delegate: CustomViewDelegate?

    func reloadData() {
        guard let (x, y) = dataSource?.getValues() else { return }
        self.x = x
        self.y = y
        xLabel.text = String(x)
        yLabel.text = String(y)
    }

    
    // MARK: - IBAction private
    @IBAction func calculateButton(_ sender: UIButton) {
         guard let action = CalculateAction(rawValue: sender.tag) else { return }
               switch action {
               case .plus:
                   result = Float(x + y)
               case .substract:
                   result = Float(x - y)
               case .mutiply:
                   result = Float(x * y)
               case .divide:
                   result = Float(x) / Float(y)
               case .modulo:
                   result = Float(x % y)
               case .exponential:
                   result = powf(Float(x), Float(y))
               case .clear:
                   result = 0
               }
               resultLabel.text = "\(result)"
           }

    @IBAction func cancelButtonTouchUpInside(_ sender: UIBarButtonItem) {
        delegate?.sendResult(view: self, needsPerfrom: .cancel)
    }
    
    @IBAction func doneButtonTouchUpInside(_ sender: UIBarButtonItem) {
        delegate?.sendResult(view: self, needsPerfrom: .sendResult(result: result))
    }
    
    @IBAction func clearButtonTouchUpInside(_ sender: UIBarButtonItem) {
        delegate?.sendResult(view: self, needsPerfrom: .clear)
        }
    }


