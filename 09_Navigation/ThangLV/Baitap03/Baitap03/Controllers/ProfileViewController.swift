import UIKit

class ProfileViewController: UIViewController {
    
    var name: String!

    @IBOutlet weak var userAvatarImageView: UIImageView!
    @IBOutlet weak var userNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(touchUpInsideDoneButton))
        userNameTextField.text = name
    }
    
    @objc func touchUpInsideDoneButton() {
        navigationController?.popViewController(animated: true)
    }
}
