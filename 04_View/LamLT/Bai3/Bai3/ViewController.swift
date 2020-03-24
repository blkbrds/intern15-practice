import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var titleHiden: UILabel!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var clearButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        passWordTextField.isSecureTextEntry = true
        loginButton.layer.masksToBounds = false
        loginButton.layer.cornerRadius = 5
        loginButton.clipsToBounds = true
        clearButton.layer.masksToBounds = false
        clearButton.layer.cornerRadius = 5
        clearButton.clipsToBounds = true
        titleHiden.isHidden = true
        self.userNameTextField.delegate = self
        self.passWordTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      super.touchesBegan(touches, with: event)
      if touches.first?.view == view {
        view.endEditing(true)
      }
    }
    
    private func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case self.userNameTextField:
            self.passWordTextField.becomeFirstResponder()
        default:
            self.passWordTextField.resignFirstResponder()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.switchBasedNextTextField(textField)
        return true
    }
    
    @IBAction func checkLoginButton(_ sender: UIButton) {
        let userName = userNameTextField.text
        let passWord = passWordTextField.text
        if userName != "Admin" || passWord != "Admin123" {
            titleHiden.isHidden = false
        } else {
            titleHiden.isHidden = true
        }
    }

    @IBAction func cleatTextLineButton(_ sender: UIButton) {
        userNameTextField.text = ""
        passWordTextField.text = ""
    }
}
