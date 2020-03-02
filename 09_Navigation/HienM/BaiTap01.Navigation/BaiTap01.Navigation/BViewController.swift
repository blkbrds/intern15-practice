import UIKit

final class BViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction private func pushToCviewController(_ sender: Any) {
		let vc = CViewController()
		navigationController?.pushViewController(vc, animated: true)
	}

	@IBAction private func backToAViewController(_ sender: Any) {
		navigationController?.popViewController(animated: true)
	}
}
