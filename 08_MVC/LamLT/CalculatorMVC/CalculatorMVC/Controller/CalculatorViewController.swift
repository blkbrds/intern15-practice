import UIKit

final class CalculatorViewController: UIViewController {

    @IBOutlet private weak var resultLable: UILabel!
    var numberSceen: Double = 0
    var previousNumber: Double = 0
    var checkMath: Bool = false
    var operating: Double = 0

    var calculatorView = Calculator()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func numberButtonTouchUpInside(_ sender: UIButton) {
        guard let resultLable1 = resultLable else {
            return
        }
        if checkMath == true {
            resultLable.text = String(sender.tag)
            numberSceen = Double(resultLable1.text ?? "0")!
            checkMath = false
        } else {
            resultLable.text = (resultLable1.text ?? "0") + String(sender.tag)
            numberSceen = Double(resultLable1.text ?? "0")!
        }
    }

    @IBAction private func operatorButtonTouchUpInside(_ sender: UIButton) {
        guard let resultLabel1 = resultLable else {
            return
        }
        if resultLable.text != "" && sender.tag != 16 {
            previousNumber = Double(resultLabel1.text)!
            switch sender.tag {
            case 10:
                resultLable.text = "+"
            case 11:
                resultLable.text = "-"
            case 12:
                resultLable.text = "x"
            case 13:
                resultLable.text = "÷"
            case 14:
                resultLable.text = "%"
            case 15:
                resultLable.text = "^"
            default:
                print("bam +-x/")
            }
            checkMath = true
            operating = Double(sender.tag)
        } else if sender.tag == 16 {
            switch operating {
            case 10:
                resultLable.text = calculatorView.sum(a: numberSceen, b: previousNumber)
            case 11:
                resultLable.text = calculatorView.sub(a: numberSceen, b: previousNumber)
            case 12:
                resultLable.text = calculatorView.mul(a: numberSceen, b: previousNumber)
            case 13:
                resultLable.text = calculatorView.div(a: numberSceen, b: previousNumber)
            case 14:
                resultLable.text = calculatorView.chiaLayDu(a: numberSceen, b: previousNumber)
            case 15:
                resultLable.text = calculatorView.logarit(a: numberSceen, b: previousNumber)
            default:
                print("")
            }
        }
    }

    @IBAction private func clearButtonTouchUpInside(_ sender: UIButton) {
        numberSceen = 0
        previousNumber = 0
        checkMath = false
        operating = 0
        resultLable.text = ""
    }
}
