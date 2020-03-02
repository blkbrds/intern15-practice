import UIKit

final class AViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction private func pushToBViewController(_ sender: Any) {
		let vc = BViewController()
		navigationController?.pushViewController(vc, animated: true)
	}
}
