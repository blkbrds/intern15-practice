import UIKit

final class DViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction private func popToBViewController(_ sender: Any) {
		let vc = (self.navigationController?.viewControllers[1])!
		navigationController?.popToViewController(vc, animated: true)
	}

	@IBAction private func popToCViewController(_ sender: Any) {
		navigationController?.popViewController(animated: true)
	}

	@IBAction private func rootToAViewCOntroller(_ sender: Any) {
		navigationController?.popToRootViewController(animated: true)
	}
}
