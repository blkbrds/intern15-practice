//
//  CaculatorViewController.swift
//  MVC
//
//  Created by PhuocNguyen on 10/14/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

final class CaculatorViewController: UIViewController {
    
    //MARK: - Properties
    private var number: Number = Number()
    private var isCaculated: Bool = false
    private var limitNumber: Float = 999999
    
    @IBOutlet private weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Action
    @IBAction func handleNumberButton(_ sender: UIButton) {
        if let _ = number.result {
            number.number = 0
            guard number.number <= limitNumber else {
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
            number.result = OperatorManager.share.calculatedResultWithOperator(result: number.result, number: number.number)
            showResult(result: number.result)
        }
        switch sender.tag {
        case 0:
            OperatorManager.share.operator = .divide
        case 1:
            OperatorManager.share.operator = .mutiplied
        case 2:
            OperatorManager.share.operator = .plus
        case 3:
            OperatorManager.share.operator = .subtract
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
        OperatorManager.share.operator = .none
    }
    
    @IBAction func calculatedResult(_ sender: Any) {
        number.result = OperatorManager.share.calculatedResultWithOperator(result: number.result, number: number.number)
        showResult(result: number.result)
        OperatorManager.share.operator = .none
        guard let result = number.result else { return }
        number.number = result
    }
    
    @IBAction func oppositeNumber(_ sender: Any) {
        number.number = -1 * number.number
        resultLabel.text = String(number.number)
        OperatorManager.share.operator = .none
    }
    
    @IBAction func convertPercent(_ sender: Any) {
        number.number = number.number / 100
        resultLabel.text = String(number.number)
        OperatorManager.share.operator = .none
    }
    
    func showResult(result: Float?) {
        guard let result = result else {
            resultLabel.text = Error.error.rawValue
            return
        }
        if result <= limitNumber {
            resultLabel.text = String(result)
        } else {
            resultLabel.text = Error.overSize.rawValue
        }
    }
}
