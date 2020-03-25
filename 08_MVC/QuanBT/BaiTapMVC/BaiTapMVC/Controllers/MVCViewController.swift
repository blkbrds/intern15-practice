import UIKit

final class MVCViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var resultLabel: UILabel!
    
    // MARK: - Properties
    private var value: Operands = Operands()
    private var result: Float = 0
    
     // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.layer.borderWidth = 2
        resultLabel.layer.borderColor = UIColor.blue.cgColor
    }
    
     // MARK: - Function
    @IBAction private func enterTheNumber(_ sender: UIButton) {
        resultLabel.text = String(value.addNumbers(number: Float(sender.tag)))
    }
    
    @IBAction private func calculate(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            Calculations.share.operand.append("+")
            resultLabel.text = "+"
            value.numbers.append(value.number)
            value.number = 0
        case 1:
            Calculations.share.operand.append("-")
            resultLabel.text = "-"
            value.numbers.append(value.number)
            value.number = 0
        case 2:
            Calculations.share.operand.append("x")
            resultLabel.text = "x"
            value.numbers.append(value.number)
            value.number = 0
        default:
            Calculations.share.operand.append("/")
            resultLabel.text = "/"
            value.numbers.append(value.number)
            value.number = 0
        }
    }
    
    @IBAction private func clearTouchUpInside(_ sender: Any) {
        resultLabel.text = "0"
        value.numbers = []
        Calculations.share.operand = []
        value.number = 0
        result = 0
    }
    
    @IBAction private func calculationResults(_ sender: Any) {
        value.numbers.append(value.number)
        Calculations.share.result = value.numbers[0]
        for index in 1 ..< value.numbers.count {
            Calculations.share.test = Calculations.share.operand[index - 1 ]
            Calculations.share.result = Calculations.share.processing(value: value.numbers[index])
        }
        result = Calculations.share.result
        if result <= 999999 {
             resultLabel.text = String(result)
        } else {
            resultLabel.text = "999999"
        }
        value.numbers = []
        Calculations.share.operand = []
        value.number = 0
    }
}
