import UIKit

protocol EditViewControllerDelegate: class {
    func controller(controller: EditViewController, needPerformAction action: EditViewController.Action)
}

class EditViewController: UIViewController {

    @IBOutlet weak var titelArletLabel: UILabel!
    @IBOutlet weak var editUserNameTextField: UITextField!
    @IBOutlet weak var editPassWordTextField: UITextField!
    @IBOutlet weak var confirmPassWordTextField: UITextField!
    
    var userName: String = ""
    var password: String = ""
    
    enum Action {
        case updateUI(userName: String?, password: String?)
    }
    
    weak var delegate: EditViewControllerDelegate?

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
        
        editUserNameTextField.text = userName
    }
    
    @objc func doneAction() {
        if editPassWordTextField.text == confirmPassWordTextField.text {
            delegate?.controller(controller: self, needPerformAction: .updateUI(userName: editUserNameTextField.text, password: editPassWordTextField.text))
            navigationController?.popViewController(animated: true)
        } else {
            titelArletLabel.isHidden = false
        }
    }

    @objc func cancelAction() {
        navigationController?.popViewController(animated: true)
    }
}
