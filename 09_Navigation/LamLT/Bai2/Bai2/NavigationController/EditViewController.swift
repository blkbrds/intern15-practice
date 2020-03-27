import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var titelArletLabel: UILabel!
    @IBOutlet weak var editUserNameTextField: UITextField!
    @IBOutlet weak var editPassWordTextField: UITextField!
    @IBOutlet weak var confirmPassWordTextField: UITextField!
    var calLogin = LoginViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit"
        let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneAction))
        navigationItem.rightBarButtonItem = rightButton

        let backButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelAction))
        navigationItem.leftBarButtonItem = backButton
        editPassWordTextField.isSecureTextEntry = true
        confirmPassWordTextField.isSecureTextEntry = true
        titelArletLabel.isHidden = true
    }
    
    @objc func doneAction() {
        if editPassWordTextField.text == confirmPassWordTextField.text {
            calLogin.userName = editUserNameTextField.text!
            calLogin.passWord = editPassWordTextField.text!
            navigationController?.popViewController(animated: true)
        } else {
            titelArletLabel.isHidden = false
        }
    }

    @objc func cancelAction() {
        navigationController?.popViewController(animated: true)
    }
}
