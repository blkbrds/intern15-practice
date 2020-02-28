import UIKit

final class ProfileViewController: BaseViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Profile"
	}

	@IBAction private func logoutButtonTapp(_ sender: Any) {
		let vc = LoginViewController()
		navigationController?.pushViewController(vc, animated: true)
	}
}
