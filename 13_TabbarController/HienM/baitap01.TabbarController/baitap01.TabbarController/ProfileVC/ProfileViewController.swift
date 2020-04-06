import UIKit

final class ProfileViewController: BaseViewController {

	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Profile"
	}

	@IBAction private func logoutButtonTouchUpInside(_ sender: Any) {
		let vc = LoginViewController()
		navigationController?.pushViewController(vc, animated: true)
	}
}