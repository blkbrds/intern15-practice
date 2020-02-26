import UIKit

class FirstViewController: UIViewController {

	@IBOutlet weak var userNameTextField: UITextField!
	@IBOutlet weak var PasswordTextField: UITextField!
	@IBOutlet weak var notificationLabel: UILabel!

	private let account1: String = "ngochien"
	private let password1: String = "duapro123"

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Login"

		let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(rightAction))
		navigationItem.rightBarButtonItem = rightButton

		notificationLabel.isHidden = true
	}

	@objc func rightAction() {
		if let username = userNameTextField.text, let password = PasswordTextField.text {
			let useraccount: (String, String) = (username, password)
			if useraccount == (account1, password1) {
				let vc = SecondViewController()
				self.navigationController?.pushViewController(vc, animated: true)
			} else {
				notificationLabel.isHidden = false
			}
		}
	}
}
