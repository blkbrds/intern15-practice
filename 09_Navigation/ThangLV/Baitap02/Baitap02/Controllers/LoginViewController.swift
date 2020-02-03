import UIKit

protocol LoginViewControllerDelegate: class {
    func viewController(viewController: LoginViewController, needPerform action: LoginViewController.Action)
}

struct FileName {
   static let users: String = "Users"
}

struct UserKeys {
    static let userNameKey: String = "userName"
    static let passwordKey: String = "password"
}

class LoginViewController: BaseViewController {
    
    enum Action {
        case showGrettingForUser(name: String)
    }
    
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passWordTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!

    private var users: [User] = []
    weak var delegate: LoginViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        title = "Login"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(touchUpInsideDoneButton))
        userNameTextField.becomeFirstResponder()
        hideKeyboardWhenTappedAround()
    }

    override func setupData() {
        users = DataManagement.shared.getUsers(fileName: FileName.users, type: "plist")
    }

    @objc func touchUpInsideDoneButton() {
        let loginViewController = LoginViewController()
        delegate?.viewController(viewController: loginViewController, needPerform: LoginViewController.Action.showGrettingForUser(name: userNameTextField.text ?? ""))
        login()
    }

    private func login() {
        if let userName = userNameTextField.text, let password = passWordTextField.text {
            let user = User(userName: userName, password: password)
            for object in users where object.password == user.password && object.userName == user.userName {
                UserDefaults.standard.set(object.userName, forKey: UserKeys.userNameKey)
                UserDefaults.standard.set(object.password, forKey: UserKeys.passwordKey)
                errorLabel.isHidden = true
                let homeViewController = HomeViewController()
                homeViewController.name = userNameTextField.text
                navigationController?.pushViewController(homeViewController, animated: true)
                return
            }
            errorLabel.isHidden = false
            errorLabel.textColor = .red
            errorLabel.text = "Login error!"
        }
    }

    @IBAction func handleClearButtonTouchUpInside(_ sender: Any) {
        userNameTextField.text = ""
        passWordTextField.text = ""
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension LoginViewController: HomeViewcontrollerDelegate {
    func viewController(viewController: HomeViewController, needPerform action: HomeViewController.Action) {
        switch action {
        case .removeDataOfTextField:
            passWordTextField.text?.removeAll()
            userNameTextField.text?.removeAll()
        }
    }
}
