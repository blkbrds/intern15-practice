
import UIKit

class RegisterViewController: BaseViewController {
	@IBOutlet weak var nameAccountTextField: UITextField!
	@IBOutlet weak var ConfirmTextField: UITextField!
	@IBOutlet weak var passwordAccountTextField: UITextField!
	
	let loginVC = LoginViewController()

	
	var username: String?{
		didSet {
			username = nameAccountTextField.text
		}
	}
	var password: String?{
		didSet {
			password = passwordAccountTextField.text
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Register"
		guard let usernameText = username, let passwordText = password else { return}
		loginVC.configData(userName: usernameText, password: passwordText)
	}
	override func setupUI() {
	}
	
	@IBAction func doneButtonTapp(_ sender: Any) {
		let tabBarView = MyTabbarViewController()
		navigationController?.pushViewController(tabBarView, animated: true)
	}
}
