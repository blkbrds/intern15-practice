import UIKit

class CalculatorViewController: UIViewController {
	@IBOutlet weak var resultLabel: UILabel!
	@IBOutlet weak var calculatorDisplay: UILabel!

	private var titleResult: String = ""
	private var numberDisplay: String = ""

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction func digitTouch(_ sender: UIButton) {
		let theNumber = sender.titleLabel?.text ?? ""
		titleResult += theNumber
		numberDisplay += theNumber
		calculatorDisplay.text = titleResult
	}

	@IBAction func clearTouch(_ sender: UIButton) {
		Calculator.share.numbers = []
		Calculator.share.calculators = []
		Calculator.share.result = 0
		resultLabel.text = "0"
		calculatorDisplay.text = ""
		titleResult = ""
	}

	@IBAction func perfomOperation(_ sender: UIButton) {
		let text = calculatorDisplay.text ?? ""
		guard text != "0" else { return }
		let calculation = sender.titleLabel?.text ?? ""
		titleResult += calculation
		calculatorDisplay.text = titleResult
		Calculator.share.addNumber(numberStr: numberDisplay)
		Calculator.share.addCalculator(calculatorStr: calculation)
		numberDisplay = ""
	}

	@IBAction func handleResult(_ sender: Any) {
		Calculator.share.addNumber(numberStr: numberDisplay)
		Calculator.share.calculator()
		resultLabel.text = "\(Calculator.share.result)"
		numberDisplay = ""
	}
}
