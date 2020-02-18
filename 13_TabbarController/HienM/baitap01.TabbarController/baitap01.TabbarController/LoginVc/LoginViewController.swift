
import UIKit

class LoginViewController: BaseViewController {

	var userNameText: String = ""
	var passwordText: String = ""

	@IBOutlet weak var falseLabel: UILabel!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var userNameTextField: UITextField!
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Home"
		falseLabel.isHidden = true
		setupUI()
	}

	func configData(userName: String, password: String) {
		userNameText = userName
		passwordText = password
	}

	override func setupUI () {
		let rightButton = UIBarButtonItem(title: "Register", style: .plain, target: self, action: #selector(registerButton))
		self.navigationItem.rightBarButtonItem = rightButton
	}

	@objc func registerButton() {
			let vc = RegisterViewController()
			navigationController?.pushViewController(vc, animated: true)
	}

	@IBAction func loginButtonTap(_ sender: Any) {
		if userNameText == passwordTextField.text, passwordTextField.text == passwordText {
			let myTabBar = MyTabbarViewController()
			SceneDelegate.shared.changtabBarController(myTabBar)
		} else {
			falseLabel.isHidden = false
		}
	}

	@IBAction func findPasswordTapp(_ sender: Any) {

	}
}
