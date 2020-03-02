import UIKit

final class SecondViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Home"
		navigationController?.navigationBar.barTintColor = .systemRed
	}

	@objc private func pushUpOutsideSecondView() {
		navigationController?.popViewController(animated: true)
	}
}
