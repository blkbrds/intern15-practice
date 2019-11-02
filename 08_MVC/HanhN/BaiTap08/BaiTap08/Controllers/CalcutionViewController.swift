//
//  CalcutionViewController.swift
//  BaiTap08
//
//  Created by ANH NGUYỄN on 10/29/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

final class CalcutionViewController: UIViewController {

    @IBOutlet weak var resultLabelLabel: UILabel!
    
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var preformingMath = false
    var operation: Double = 0
    private var isCalculated: Bool = false
    private var limitNumber: Float = 999999
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func chooseNumber(_ sender: Any) {
        if preformingMath == true
        {
            resultLabelLabel.text = String((sender as AnyObject).tag - 1)
            numberOnScreen = Double(resultLabelLabel.text!)!
            preformingMath = false
        }
        else
        {
            resultLabelLabel.text = resultLabelLabel.text! + String((sender as AnyObject).tag - 1)
            numberOnScreen = Double(resultLabelLabel.text!)!
        }
    }
    
    @IBAction func calculationButton(_ sender: UIButton) {
        if resultLabelLabel.text != "" && sender.tag != 11 && sender.tag != 16
        {
            previousNumber = Double(resultLabelLabel.text!)!
            if sender.tag == 12 {
                resultLabelLabel.text = "/"
            }
            else if sender.tag == 13 {
                resultLabelLabel.text = "x"
            }
            else if sender.tag == 14 {
                resultLabelLabel.text = "-"
            }
            else if sender.tag == 15 {
                resultLabelLabel.text = "+"
            }
            else if sender.tag == 17 {
                resultLabelLabel.text = String(previousNumber / 100)
            }
            else if sender.tag == 18 {
                resultLabelLabel.text = String(-previousNumber )
            }
            else {
                resultLabelLabel.text = String(previousNumber )
            }
            operation = Double(sender.tag)
            preformingMath = true
        }
        else if sender.tag == 16 {
            if operation == 12 {
                Data.share.calculateResult(operation: .div, previousNumber: previousNumber, numberOnScreen: numberOnScreen)
                resultLabelLabel.text = ("\(Data.share.result)")
            }
            else if operation == 13 {
                Data.share.calculateResult(operation: .mul, previousNumber: previousNumber, numberOnScreen: numberOnScreen)
                resultLabelLabel.text = ("\(Data.share.result)")
            }
            else if operation == 14 {
                Data.share.calculateResult(operation: .minus, previousNumber: previousNumber, numberOnScreen: numberOnScreen)
                resultLabelLabel.text = ("\(Data.share.result)")
            }
            else if operation == 15 {
                Data.share.calculateResult(operation: .plus, previousNumber: previousNumber, numberOnScreen: numberOnScreen)
                resultLabelLabel.text = ("\(Data.share.result)")
            }
        }
        else if sender.tag == 11 {
            resultLabelLabel.text = ""
            operation = 0
            previousNumber = 0
            numberOnScreen = 0
        }
    }
}

