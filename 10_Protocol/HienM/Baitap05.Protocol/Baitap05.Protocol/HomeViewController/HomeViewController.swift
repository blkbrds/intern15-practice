import UIKit

final class HomeViewController: UIViewController {

	@IBOutlet private weak var valueYTextField: UITextField!
	@IBOutlet private weak var valueXTextField: UITextField!
	@IBOutlet private weak var resultLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	@IBAction private func appearCaculateView(_ sender: Any) {
		let calculaterView = Bundle.main.loadNibNamed("CalculateView", owner: self, options: nil)?.first as! CalculateView
		calculaterView.frame = CGRect(x: 32, y: 300, width: 350, height: 300)
		calculaterView.dataSource = self
		calculaterView.configView()
		calculaterView.deligate = self
		view.addSubview(calculaterView)
	}
}

extension HomeViewController: CalculateViewDataSource {
	func getX() -> Int? {
		guard let x = valueXTextField.text else { return 0 }
		return Int(x)
	}
	
	func getY() -> Int? {
		guard let y = valueYTextField.text else { return 0 }
		return Int(y)
	}
}

extension HomeViewController: CalculateViewDeligate {
	func calculateView(view: CalculateView, needPerformAction action: CalculateView.action) {
		switch action {
		case .clearAction(let clearText):
			valueXTextField.text = clearText
			valueYTextField.text = clearText
		case .doneAction(let resultText):
			resultLabel.text = resultText
		}
	}
}
