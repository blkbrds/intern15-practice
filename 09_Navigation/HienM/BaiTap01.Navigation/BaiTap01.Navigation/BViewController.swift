import UIKit

final class BViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	@IBAction private func push(_ sender: Any) {
		let vc = CViewController()
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
	@IBAction private func back(_ sender: Any) {
		navigationController?.popViewController(animated: true)
	}
}
