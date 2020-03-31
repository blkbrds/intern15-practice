import UIKit

class EditViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var profileImageView: UIImageView!
    var nameImage: String = ""
    var nameLabelAvatar: String = ""

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
    }

    @objc func cancelButtonTouchUpInside() {
        navigationController?.popViewController(animated: true)
    }
}


