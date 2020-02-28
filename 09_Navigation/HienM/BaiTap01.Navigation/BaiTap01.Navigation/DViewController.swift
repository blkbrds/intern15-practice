import UIKit

final class DViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction private func poptoB(_ sender: Any) {
		let vc = (self.navigationController?.viewControllers[1])!
		navigationController?.popToViewController(vc, animated: true)
	}

	@IBAction private func pop(_ sender: Any) {
		navigationController?.popViewController(animated: true)
	}

	@IBAction private func root(_ sender: Any) {
		navigationController?.popToRootViewController(animated: true)
	}
}
