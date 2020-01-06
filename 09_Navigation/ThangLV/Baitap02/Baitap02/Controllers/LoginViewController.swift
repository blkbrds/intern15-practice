import UIKit

protocol LoginViewControllerDelegate: class {
    func showGrettingForUser(name: String)
}

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    private var users: [User] = []
    var delegate: LoginViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
        title = "Login"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(touchUpInsideDoneButton))
        userNameTextField.becomeFirstResponder()
        self.hideKeyboardWhenTappedAround()
    }
    
    override func setUpData() {
        users = DataManagement.shared.getUsers(fileName: "Users", type: "plist")
    }
    
    @objc func touchUpInsideDoneButton() {
        delegate?.showGrettingForUser(name: userNameTextField.text ?? "")
        login()
    }
    
    private func login() {
        if let userName = userNameTextField.text, let password = passWordTextField.text {
            let user = User(userName: userName, password: password)
            for object in users where object.password == user.password && object.userName == user.userName {
                UserDefaults.standard.set(object.userName, forKey: "userName")
                UserDefaults.standard.set(object.password, forKey: "password")
                errorLabel.isHidden = true
                let homeViewController = HomeViewController()
                homeViewController.name = userNameTextField.text
                navigationController?.pushViewController(homeViewController, animated: true)
                return
            }
            errorLabel.isHidden = false
            errorLabel.textColor = .red
            errorLabel.text = "Login error!"
            print("Login error!")
        }
    }
    
    @IBAction func handleClearButtonTouchUpInside(_ sender: Any) {
        userNameTextField.text = ""
        passWordTextField.text = ""
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension LoginViewController: HomeViewcontrollerDelegate {
    func removeDataOfTextField() {
        self.passWordTextField.text = ""
        self.userNameTextField.text = ""
    }
}

