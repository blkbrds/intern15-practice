//
//  CaculatorViewController.swift
//  MVC
//
//  Created by PhuocNguyen on 10/14/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class CaculatorViewController: UIViewController {
    
    //MARK: - Properties
    var number: Number = Number()
    var isCaculated: Bool = false
    
    @IBOutlet private weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Action
    @IBAction func handleNumberButton(_ sender: UIButton) {
        if let _ = number.result {
            number.number = 0
            guard number.number < 999999 else {
                return
            }
            number.convertToNumber(with: sender.tag)
            resultLabel.text = String(number.number)
            isCaculated = true
        }
    }
    
    @IBAction func handleOperatorButton(_ sender: UIButton) {
        guard let _ = number.result else { return }
        if isCaculated {
            number.result = OperatorManager.caculate.caculated(result: number.result, number: number.number)
            showResult(result: number.result)
        }
        switch sender.tag {
        case 0:
            OperatorManager.caculate.operate = .divide
        case 1:
            OperatorManager.caculate.operate = .mutiplied
        case 2:
            OperatorManager.caculate.operate = .plus
        case 3:
            OperatorManager.caculate.operate = .subtract
        default:
            break
        }
        isCaculated = false
    }
    
    @IBAction func clearResultLabel() {
        resultLabel.text = "0"
        number.number = 0
        number.result = 0
        isCaculated = false
        OperatorManager.caculate.operate = .none
    }
    
    @IBAction func equal(_ sender: Any) {
        number.result = OperatorManager.caculate.caculated(result: number.result, number: number.number)
        showResult(result: number.result)
        OperatorManager.caculate.operate = .none
        guard let result = number.result else { return }
        number.number = result
    }
    
    @IBAction func oppositeNumber(_ sender: Any) {
        number.number = -1 * number.number
        resultLabel.text = String(number.number)
        OperatorManager.caculate.operate = .none
    }
    
    @IBAction func convertPercent(_ sender: Any) {
        number.number = number.number / 100
        resultLabel.text = String(number.number)
        OperatorManager.caculate.operate = .none
    }
    
    func showResult(result: Float?) {
        guard let result = result else {
            resultLabel.text = Error.error.rawValue
            return
        }
        if result <= 999999 {
            resultLabel.text = String(result)
        } else {
            resultLabel.text = Error.overSize.rawValue
        }
    }
}
