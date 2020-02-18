
import UIKit

class ProfileViewController: BaseViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Profile"
	}

	@IBAction func logoutButtonTapp(_ sender: Any) {
		let vc = LoginViewController()
		navigationController?.pushViewController(vc, animated: true)
	}
}
