
import UIKit

class AViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "FirstViewController"
	}
	@IBAction func push (_ sender: Any) {
		let vc = BViewController()
		self.navigationController?.pushViewController(vc, animated: true)

		
	}

}
