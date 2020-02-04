import UIKit

class AViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	@IBAction func push(_ sender: Any) {
		let vc = BViewController()
		self.navigationController?.pushViewController(vc, animated: true)
	}
}
