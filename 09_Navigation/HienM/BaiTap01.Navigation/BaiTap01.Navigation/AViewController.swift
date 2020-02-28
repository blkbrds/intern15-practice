import UIKit

final class AViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	@IBAction private func push(_ sender: Any) {
		let vc = BViewController()
		self.navigationController?.pushViewController(vc, animated: true)
	}
}
