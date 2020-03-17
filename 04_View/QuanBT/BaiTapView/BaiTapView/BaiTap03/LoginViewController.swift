import UIKit

final class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTextFields: UITextField!
    @IBOutlet weak var passwordTextFields: UITextField!
    @IBOutlet weak var reportLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    let username: String = "Admin"
    let password: String = "Admin123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        usernameTextFields.layer.borderColor = UIColor.brown.cgColor
           passwordTextFields.layer.borderColor = UIColor.brown.cgColor
           usernameTextFields.layer.borderWidth = 2
           passwordTextFields.layer.borderWidth = 2
           usernameTextFields.layer.cornerRadius = 5
           passwordTextFields.layer.cornerRadius = 5
           loginButton.layer.cornerRadius = 5
           clearButton.layer.cornerRadius = 5
           loginButton.clipsToBounds = true
           clearButton.clipsToBounds = true
           usernameTextFields.delegate = self
           usernameTextFields.tag = 0
           passwordTextFields.delegate = self
           passwordTextFields.tag = 1
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           view.endEditing(true)
       }
       
    func login() {
        switch (usernameTextFields.text, passwordTextFields.text) {
        case (username, password):
        reportLabel.text = "Bạn đã đăng nhập thành công"
        case ("", ""):
            reportLabel.text = "Bạn chưa nhập username và password"
        case ("", _):
            reportLabel.text = "Bạn chưa nhập username"
        case (_, ""):
            reportLabel.text = "Bạn chưa nhập password"
        default:
            reportLabel.text = "Bạn nhập sai username hoặc password"
        }
        view.endEditing(true)
    }
    
    @IBAction func login(_ sender: Any) {
        login()
    }
    
    @IBAction func clear(_ sender: Any) {
        usernameTextFields.text = ""
        passwordTextFields.text = ""
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 0 {
            passwordTextFields.becomeFirstResponder() }
        if textField.tag == 1 {
            login()
        }
    }
}
