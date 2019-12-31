import UIKit

final class PasswordViewController: UIViewController {

	@IBOutlet private weak var nameTextField: UITextField!
	@IBOutlet private weak var passwordTextField: UITextField!
	@IBOutlet private weak var inforLabel: UILabel!
	@IBOutlet private weak var password: UILabel!
	@IBOutlet private weak var Name: UILabel!

	let userName1: String = "alibama"
	let userPassword1: String = "abcd1234"

	override func viewDidLoad() {
		super.viewDidLoad()

		configureTextField()
		confirgureTapGesture()
		inforLabel.isHidden = true
		nameTextField.returnKeyType = .next
		passwordTextField.returnKeyType = .done
	}

	func confirgureTapGesture() {
		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(PasswordViewController.handleTap))
		view.addGestureRecognizer(tapGesture)
	}

	@IBAction private func clearAccount(_ sender: Any) {
		nameTextField.text = nil
		passwordTextField.text = nil
	}

	@objc private func handleTap() {
		view.endEditing(true)
	}

	@IBAction private func loginTap(_ sender: Any) {
		view.endEditing(true)
		accountlogins()
	}

	private func configureTextField () {
		nameTextField.delegate = self
		passwordTextField.delegate = self
	}

	func accountlogins () {
		if let account = nameTextField.text, let password = passwordTextField.text {
			let useraccount: (String, String) = (account, password)
			if useraccount == (userName1, userPassword1) {
				inforLabel.isHidden = true
			}
			else {
				inforLabel.isHidden = false
				inforLabel.text = exception(stringData: useraccount)
			}
		}
	}

	private func exception(stringData: (String, String)) -> String {

		var errorString = ""

		switch stringData {
		case ("", ""):
			errorString = "Bạn chưa nhập dữ liệu"
		case ("", _):
			errorString = "Bạn chưa điền username"
		case (_, ""):
			errorString = "Bạn chưa điền password"
		default:
			errorString = "Nhập sai tên username hoặc password"
		}
		return errorString
	}
}

extension PasswordViewController: UITextFieldDelegate {

	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		if textField == nameTextField {
			nameTextField.resignFirstResponder()
			passwordTextField.becomeFirstResponder()
		}
		return true
	}
}
