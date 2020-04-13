import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var alertLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    
    var userNameTest = "abcd"
    var passWordTest = "1234"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        let registerButton = UIBarButtonItem(title: "Register", style: .plain, target: self, action: #selector(registerButtonTouchUpInside))
        navigationItem.rightBarButtonItem = registerButton

        let forGotPasswordButton = UIBarButtonItem(title: "ForGot PassWord", style: .plain, target: self, action: #selector(forGotPasswordButtonTouchUpInside))
        navigationItem.leftBarButtonItem = forGotPasswordButton

        alertLabel.isHidden = true
    }

    @objc func registerButtonTouchUpInside() {
        let registerVC = RegisterViewController()
        navigationController?.pushViewController(registerVC, animated: true)
    }

    @objc func forGotPasswordButtonTouchUpInside() {
        let forGotPassWordVC = ForGotPassWordViewController()
        navigationController?.pushViewController(forGotPassWordVC, animated: true)
    }
    
    @IBAction func loginButtonTouchUpInside(_ sender: UIButton) {
        if userNameTextField.text == userNameTest && passWordTextField.text == passWordTest {
            SceneDelegate.shared.tabBarController()
        } else {
            alertLabel.isHidden = false
        }
    }
}
