import UIKit

class SquareViewController: UIViewController {
	@IBOutlet var squareButton: [UIButton]!
	@IBOutlet var widthWidthConstraintButtons: [NSLayoutConstraint]!

	override func viewDidLoad() {
		super.viewDidLoad()
	}
	@IBAction func squareButton(_ sender: UIButton) {
		let widthList = widthWidthConstraintButtons.map({ $0.constant })
		let max = widthList.max() ?? 0.0
		print(max)
		widthWidthConstraintButtons.forEach({
			$0.constant = 80
		})
		widthWidthConstraintButtons[sender.tag].constant = 160
		UIView.animate(withDuration: 1) {
			self.view.layoutIfNeeded()
		}
	}
}
