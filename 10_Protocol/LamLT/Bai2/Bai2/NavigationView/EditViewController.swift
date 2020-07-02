import UIKit

protocol EditAvatarDelegate: class {
    func controller(controller: EditViewController, needPerformAction action: EditViewController.Action)
}

class EditViewController: UIViewController {
    weak var delegate: EditAvatarDelegate?
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var profileImageView: UIImageView!
    var nameImage: String = ""
    var nameLabelAvatar: String = ""
    
    enum Action {
         case updateUI(nameImage: String?)
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donButtonTouchUpInside))
        navigationItem.rightBarButtonItem = rightButton

        let imageBack = UIImage(named: "iconBack")
        let backButton = UIBarButtonItem(image: imageBack, style: .plain, target: self, action: #selector(cancelButtonTouchUpInside))
        navigationItem.leftBarButtonItem = backButton

        nameTextField.text = nameLabelAvatar
        profileImageView.image = UIImage(named: nameImage)
    }

    @objc func donButtonTouchUpInside() {
        navigationController?.popViewController(animated: true)
        guard let nameImage = nameTextField.text else { return }
        if let delegate = delegate {
            delegate.controller(controller: self, needPerformAction: .updateUI(nameImage: nameImage))
        }
    }

    @objc func cancelButtonTouchUpInside() {
        navigationController?.popViewController(animated: true)
    }
}


