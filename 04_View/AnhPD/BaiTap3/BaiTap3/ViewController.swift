
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var failLabel: UILabel!
    
    var userName: String = "Admin"
    var passWord: String = "Admin123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        failLabel.isHidden = true
        passWordTextField.isSecureTextEntry = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if touches.first?.view == view {
            view.endEditing(true)
        }
    }
    
    @IBAction func login(_ sender: UIButton) {
        
        if userNameTextField.text == userName && passWordTextField.text == passWord {
            print("Đăng nhập thành công")
            failLabel.isHidden = true
        } else {
            failLabel.isHidden = false
        }
    }
    
    @IBAction func clear(_ sender: UIButton) {
        userNameTextField.text = ""
        passWordTextField.text = ""
    }
}
