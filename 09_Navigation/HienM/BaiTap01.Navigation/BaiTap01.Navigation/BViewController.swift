import UIKit

class BViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	@IBAction func push(_ sender: Any) {
		let vc = CViewController()
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
	@IBAction func back(_ sender: Any) {
		navigationController?.popViewController(animated: true)
	}
}
