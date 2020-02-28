import UIKit

final class RegisterViewController: BaseViewController {
	
	@IBOutlet weak private var nameAccountTextField: UITextField!
	@IBOutlet weak private var ConfirmTextField: UITextField!
	@IBOutlet weak private var passwordAccountTextField: UITextField!

	let loginVC = LoginViewController()
	var username: String? {
		didSet {
			username = nameAccountTextField.text
		}
	}
	var password: String? {
		didSet {
			password = passwordAccountTextField.text
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Register"
		guard let usernameText = username, let passwordText = password else { return }
		loginVC.configData(userName: usernameText, password: passwordText)
	}

	@IBAction private func doneButtonTapp(_ sender: Any) {
		let myTabBar = MyTabbarViewController()
		SceneDelegate.shared.changtabBarController(myTabBar)
	}
}
