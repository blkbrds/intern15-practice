import UIKit

final class CalculatorViewController: UIViewController {
    
    @IBOutlet private weak var resultLabel: UILabel!
    
    private var number: Number = Number()
    private var isCalculated: Bool = false
    private let limitedNumber: Float = 9999999
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "0"
    }
    
    private func showResult(result: Float?) {
        guard let result = result else { return }
        if result < limitedNumber {
            resultLabel.text = String(result).toInteger()
        }
    }
    
    @IBAction func handleInputNumberButtonTouchUpInside(_ sender: UIButton) {
        if let _ = number.calculatedResult {
            guard number.inputNumber <= limitedNumber else { return }
            number.convertToNumber(with: sender.tag)
            resultLabel.text = String(number.inputNumber).toInteger()
            isCalculated = true
        }
    }
    
    
    @IBAction func handleCalculatingButtonTouchUpInside(_ sender: UIButton) {
        guard let _ = number.calculatedResult else { return }
        if isCalculated {
            number.calculatedResult = OperatorManager.shared().calculateWithOperator(result: number.calculatedResult, operand: number.inputNumber)
            showResult(result: number.calculatedResult)
        }
        switch sender.tag {
        case 10:
            OperatorManager.shared().operator = .add
        case 11:
            OperatorManager.shared().operator = .substract
        case 12:
            OperatorManager.shared().operator = .multiple
        case 13:
            OperatorManager.shared().operator = .divide
        default:
            break
        }
        number.inputNumber = 0
        isCalculated = false
    }
    
    
    @IBAction func handleClearAllButtonTouchUpInside(_ sender: Any) {
        resultLabel.text = "0"
        isCalculated = false
        number.inputNumber = 0
        number.calculatedResult = 0
        OperatorManager.shared().operator = .none
    }
    
    
    @IBAction func handleEqualButtonTouchUpInside(_ sender: Any) {
        number.calculatedResult = OperatorManager.shared().calculateWithOperator(result: number.calculatedResult, operand: number.inputNumber)
        showResult(result: number.calculatedResult)
        OperatorManager.shared().operator = .none
        guard let result = number.calculatedResult else { return }
        number.inputNumber = result
    }
}

extension String {
    func toInteger() -> String {
        guard let number = Float(self) else { return self }
        let temp = round(number)
        if temp - number == 0 {
            return "\(Int(temp))"
        }
        return self
    }
}
