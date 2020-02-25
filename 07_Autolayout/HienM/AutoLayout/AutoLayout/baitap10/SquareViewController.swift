import UIKit

class SquareViewController: UIViewController {

	@IBOutlet private var squareButton: [UIButton]!
	@IBOutlet private var widthWidthConstraintButtons: [NSLayoutConstraint]!

	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	private func changeSizeSquare (sender : Int) {
		widthWidthConstraintButtons.forEach({
			$0.constant = 80
		})
		widthWidthConstraintButtons[sender].constant = 160
		UIView.animate(withDuration: 0.5) {
			self.view.layoutIfNeeded()
		}
	}

	@IBAction func squareButton(_ sender: UIButton) {
		changeSizeSquare(sender: sender.tag)
	}
}
