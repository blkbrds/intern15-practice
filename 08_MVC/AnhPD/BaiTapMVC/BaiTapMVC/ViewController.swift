//
//  ViewController.swift
//  BaiTapMVC
//
//  Created by PCI0012 on 4/17/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var save: SaveData = SaveData()
    var result: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func numbersButtonTouchUpInSide(_ sender: UIButton) {
        textField.text = String(save.addNumber(number: Float(sender.tag)))
    }
    
    @IBAction func selectionsButtonTouchUpInSide(_ sender: UIButton) {
        
        switch sender.tag {
        case 10:
            textField.text = "+"
//            Calculator.share.add(value: save.number)
            Calculator.share.operands.append("+")
            save.numbers.append(save.number)
            save.number = 0
            
        case 11:
            textField.text = "-"
            Calculator.share.operands.append("-") //thêm toán hạng vào mảng operand ổ class Calculator
            save.numbers.append(save.number)
            save.number = 0
        case 12:
            textField.text = "x"
            Calculator.share.operands.append("x")
            save.numbers.append(save.number)
            save.number = 0
        default:
            textField.text = "/"
            Calculator.share.operands.append("/")
            save.numbers.append(save.number)
            save.number = 0
        }
    }
    
    @IBAction func clearButtonTouchUpInSide(_ sender: Any) {
        textField.text = ""
        save.numbers = []
        Calculator.share.operands = []
        save.number = 0
        result = 0
    }
    
    @IBAction func resultButtonTouchUpInSide(_ sender: Any) {
        guard save.number != 0 else {
            return
        }
        save.numbers.append(save.number)
        if save.numbers[0] == 0 {
            Calculator.share.result = result // result ở class Calculator = result(ket qua vua tinh)
            Calculator.share.test = Calculator.share.operands[0]
            result = Calculator.share.calculation(value: save.numbers[1])
        } else {
            Calculator.share.result = save.numbers[0] // result ở class Calculator = phần từ đầu tiên của mảng numbers ở class saveData
            for i in 1..<save.numbers.count { //cho chạy từ 1 vì ta khai báo ở trên result ở class Calculator đã = phần tử dầu tiên của mảng number[0]
                Calculator.share.test = Calculator.share.operands[i - 1] //test ở class Calculator bằng phần tử vị trí thử i ở mảng operands ở class Calculator. Để dùng switch..
                Calculator.share.result = Calculator.share.calculation(value: save.numbers[i])
            }
            result = Calculator.share.result
        }
        textField.text = String(result)
        save.numbers = []
        save.number = 0
        Calculator.share.operands = []
    }
}
