import UIKit

protocol ProFileViewControllerDelegate: class {
    func viewController(viewController: ProfileViewController, needPerform action: ProfileViewController.Action)
}

class ProfileViewController: UIViewController {
    
    enum Action {
        case changeDataToHomePage(updatedUserName: String)
    }
    
    var name: String!
    var image: UIImage!
    weak var delegate: ProFileViewControllerDelegate?
    
    @IBOutlet private weak var userAvatarImageView: UIImageView!
    @IBOutlet private weak var userNameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTouchUpInside))
        updateUI()
    }
    
    private func updateUI() {
        userNameTextField.text = name
        userNameTextField.contentMode = .scaleToFill
        userAvatarImageView.image = image
    }
    
    @objc func doneButtonTouchUpInside() {
        delegate?.viewController(viewController: self, needPerform: ProfileViewController.Action.changeDataToHomePage(updatedUserName: userNameTextField.text ?? ""))
        navigationController?.popViewController(animated: true)
    }
}
