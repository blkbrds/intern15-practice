import UIKit

protocol ProfileViewControllerDelegate: class {
	func controller(controller: ProfileViewController, needPerformAction action: ProfileViewController.Action)
}

final class ProfileViewController: UIViewController {

	@IBOutlet private weak var avatarImageView: UIImageView!
	@IBOutlet private weak var userNameTextField: UITextField!

	weak var delegate: ProfileViewControllerDelegate?
	var name: String?

	enum Action {
		case updateName(nameUserUpdate: String)
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		title = "Profile"
		let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(popToViewController
			))
		navigationItem.rightBarButtonItem = rightButton
		userNameTextField.text = name
	}

	@objc private func popToViewController() {
		navigationController?.popViewController(animated: true)
		guard let name = userNameTextField.text else { return }
		if let delegate = delegate {
			delegate.controller(controller: self, needPerformAction: .updateName(nameUserUpdate: name))
		}
	}
}
