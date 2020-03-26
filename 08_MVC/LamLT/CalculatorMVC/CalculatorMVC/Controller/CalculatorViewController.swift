import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var resultLable: UILabel!
    var numberSceen: Double = 0
    var previousNumber: Double = 0
    var checkMath: Bool = false
    var operating = 0

    var calculatorView = Calculator()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func numberButtonTouchUpInside(_ sender: UIButton) {
        if checkMath == true {
            resultLable.text = String(sender.tag)
            numberSceen = Double(resultLable.text!)!
            checkMath = false
        } else {
            resultLable.text = resultLable.text! + String(sender.tag)
            numberSceen = Double(resultLable.text!)!
        }
    }

    @IBAction func operatorButtonTouchUpInside(_ sender: UIButton) {
        if resultLable.text != "" && sender.tag != 16 {
            previousNumber = Double(resultLable.text!)!
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
            operating = sender.tag
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

    @IBAction func clearButtonTouchUpInside(_ sender: UIButton) {
        numberSceen = 0
        previousNumber = 0
        checkMath = false
        operating = 0
        resultLable.text = ""
    }
}
