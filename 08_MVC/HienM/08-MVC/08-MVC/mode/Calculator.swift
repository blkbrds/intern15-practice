import UIKit

enum CalculatorEnum {
	case addition
	case subtrantion
	case multiplication
	case devision
}

final class Calculator {
	var numbers: [Int] = []
	var calculators: [CalculatorEnum] = []
	var result: Int = 0
	static let share = Calculator()

	func calculator() {
		var result = numbers[0]
		for i in 1..<numbers.count {
			let number = numbers[i]
			let calculator = calculators[i - 1]

			switch calculator {
			case .addition:
				result += number
			case .subtrantion:
				result -= number
			case .multiplication:
				result *= number
			case .devision:
				result = number == 0 ? 0 : result / number
			}
		}
		self.result = result
	}

	func addNumber(numberStr: String) {
		guard let number = Int(numberStr) else { return }
		numbers.append(number)
	}

	func addCalculator(calculatorStr: String) {
		switch calculatorStr {
		case "+":
			self.calculators.append(.addition)
		case "-":
			self.calculators.append(.subtrantion)
		case "x":
			self.calculators.append(.multiplication)
		case "/":
			self.calculators.append(.devision)
		default:
			return
		}
	}
}

