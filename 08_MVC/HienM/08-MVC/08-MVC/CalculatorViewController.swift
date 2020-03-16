import UIKit

final class CalculatorViewController: UIViewController {

	@IBOutlet weak private var resultLabel: UILabel!
	@IBOutlet weak private var calculatorDisplayLabel: UILabel!

	private var titleResult: String = ""
	private var numberDisplay: String = ""

	@IBAction private func digitButtonTouchUpInside(_ sender: UIButton) {
		guard let theNumber = sender.titleLabel?.text else { return }
		titleResult += theNumber
		numberDisplay += theNumber
		calculatorDisplayLabel.text = titleResult
	}

	@IBAction private func clearButtonTouchUpInside(_ sender: UIButton) {
		Calculator.share.numbers = []
		Calculator.share.calculators = []
		Calculator.share.result = 0
		resultLabel.text = "0"
		calculatorDisplayLabel.text = ""
		titleResult = ""
	}

	@IBAction private func perfomOperationButtonTouchUpInside(_ sender: UIButton) {
		guard let text = calculatorDisplayLabel.text else { return }
		guard text != "0" else { return }
		guard let calculation = sender.titleLabel?.text else { return }
		titleResult += calculation
		calculatorDisplayLabel.text = titleResult
		Calculator.share.addNumber(numberStr: numberDisplay)
		Calculator.share.addCalculator(calculatorStr: calculation)
		numberDisplay = ""
	}

	@IBAction private func handleResultButtonTouchUpInside(_ sender: Any) {
		Calculator.share.addNumber(numberStr: numberDisplay)
		Calculator.share.calculator()
		resultLabel.text = "\(Calculator.share.result)"
		numberDisplay = ""
	}
}
