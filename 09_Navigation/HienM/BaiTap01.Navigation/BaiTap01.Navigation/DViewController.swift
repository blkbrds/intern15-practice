import UIKit

class DViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction func poptoB(_ sender: Any) {
		let vc = (self.navigationController?.viewControllers[1])!
		navigationController?.popToViewController(vc, animated: true)
	}

	@IBAction func pop(_ sender: Any) {
		navigationController?.popViewController(animated: true)
	}

	@IBAction func root(_ sender: Any) {
		navigationController?.popToRootViewController(animated: true)
	}
}
