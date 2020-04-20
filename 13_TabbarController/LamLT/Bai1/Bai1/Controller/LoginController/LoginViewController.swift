import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var alertLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!

    var userNameTest = "abcd"
    var passWordTest = "qweqwe"

    var viewModel = LoginViewModel(userName: "ohyeah", password: "qweqwe")

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        let registerButton = UIBarButtonItem(title: "Register", style: .plain, target: self, action: #selector(registerButtonTouchUpInside))
        navigationItem.rightBarButtonItem = registerButton

        let forGotPasswordButton = UIBarButtonItem(title: "ForGot PassWord", style: .plain, target: self, action: #selector(forGotPasswordButtonTouchUpInside))
        navigationItem.leftBarButtonItem = forGotPasswordButton
        passWordTextField.isSecureTextEntry = true
        alertLabel.isHidden = true
    }

    override func setupUI() {
        super.setupUI()
        self.title = "Login"
        updateView()
    }

    func updateView() {
        userNameTextField.text = viewModel.userName
        passWordTextField.text = viewModel.password
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
        let userName = userNameTextField.text ?? ""
        let password = passWordTextField.text ?? ""

        let complete: LoginViewModel.Completion = { (result) in
            switch result {
            case .success:
//                SceneDelegate.shared.tabBarController()
                let scene = UIApplication.shared.connectedScenes.first
                if let sd: SceneDelegate = (scene?.delegate as? SceneDelegate) {
                    sd.changeScreen(type: .tabbar)
                }
                print("Login OK")
                self.updateView()
            case .failure(let isError, let errorMsg):
                if isError {
                    self.alertLabel.isHidden = false
                    print("Login Failed \(errorMsg)")
                }
            }
        }
        viewModel.login(userName: userName, password: password, completion: complete) }
}
