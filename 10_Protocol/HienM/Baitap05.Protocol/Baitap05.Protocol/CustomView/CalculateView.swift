import SwiftUI

protocol CalculateViewDataSource: class {
	func getX() -> Int?
	func getY() -> Int?
}

protocol CalculateViewDeligate: class {
	func calculateView(view : CalculateView , needPerformAction action : CalculateView.action )
}

class CalculateView: UIView {

	weak var dataSource: CalculateViewDataSource?
	weak var deligate: CalculateViewDeligate?
	
	enum action {
		case doneAction(resultText : String?)
		case clearAction(clearText : String? )
	}

	@IBOutlet weak var xResultLabel: UILabel!
	@IBOutlet weak var yResultLabel: UILabel!
	@IBOutlet weak var resultLabel: UILabel!

	private var x: Int?
	private var y: Int?
	private var result: Double?
	
	func configView() {
		guard let x = dataSource?.getX(), let y = dataSource?.getY() else { return }
		xResultLabel.text = String(x)
		yResultLabel.text = String(y)
	}

	@IBAction private func calculartorAction(_ sender: UIButton) {
		guard let x = dataSource?.getX(), let y = dataSource?.getY() else { return }
		
		switch sender.tag {
		case 1:
			result = Double(x + y)
		case 2:
			result = Double(x - y)
		case 3:
			result = Double(x * y)
		case 4:
			result = Double(x / y)
		case 5:
			result = Double(x % y)
		case 6:
			result = Double(pow(Double(x), Double(y)))
		default:
			clearButton(self)
		}
		
		guard let result = result else { return }
		resultLabel.text = String(result)
	}

	@IBAction private func clearButton(_ sender: Any) {
		xResultLabel.text = ""
		yResultLabel.text = ""
		
		deligate?.calculateView(view: self, needPerformAction: .clearAction(clearText: ""))
	}

	@IBAction private func cannelAction(_ sender: Any) {
		self.isHidden = true
	}
	
	@IBAction private func completeButton(_ sender: Any) {
		self.isHidden = true
		
		guard let result = result else { return }
		deligate?.calculateView(view: self, needPerformAction: .doneAction(resultText: String(result)))
		
	}
}

