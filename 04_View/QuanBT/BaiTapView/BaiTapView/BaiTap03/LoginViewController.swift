import UIKit

final class LoginViewController: UIViewController {
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var labelReport: UILabel!
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var buttonClear: UIButton!
    
    let username: String = "Admin"
    let password: String = "Admin123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldUsername.layer.borderColor = UIColor.brown.cgColor
        textFieldPassword.layer.borderColor = UIColor.brown.cgColor
        textFieldUsername.layer.borderWidth = 2
        textFieldPassword.layer.borderWidth = 2
        textFieldUsername.layer.cornerRadius = 5
        textFieldPassword.layer.cornerRadius = 5
        buttonLogin.layer.cornerRadius = 5
        buttonClear.layer.cornerRadius = 5
        buttonLogin.clipsToBounds = true
        buttonClear.clipsToBounds = true
        textFieldUsername.delegate = self
        textFieldUsername.tag = 0
        textFieldPassword.delegate = self
        textFieldPassword.tag = 1
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           view.endEditing(true)
       }
       
    func login() {
        switch (textFieldUsername.text, textFieldPassword.text) {
        case (username, password):
        labelReport.text = "Bạn đã đăng nhập thành công"
        case ("", ""):
            labelReport.text = "Bạn chưa nhập username và password"
        case ("", _):
            labelReport.text = "Bạn chưa nhập username"
        case (_, ""):
            labelReport.text = "Bạn chưa nhập password"
        default:
            labelReport.text = "Bạn nhập sai username hoặc password"
        }
        view.endEditing(true)
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        login()
    }
    
    @IBAction func actionClear(_ sender: Any) {
        textFieldUsername.text = ""
        textFieldPassword.text = ""
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 0 {
            textFieldPassword.becomeFirstResponder() }
        if textField.tag == 1 {
            login()
        }
    }
}
