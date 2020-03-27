import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var profileImageView: UIImageView!
    var nameImage: String = ""
    var name: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneAction))
        navigationItem.rightBarButtonItem = rightButton
        
        let imageBack = UIImage(named: "iconBack")
//        UIEdgeInsets()
        let backButton = UIBarButtonItem(image: imageBack, style: .plain, target: self, action: #selector(cancelAction))
        navigationItem.leftBarButtonItem = backButton
        
        nameTextField.text = name
        profileImageView.image = UIImage(named: nameImage)
    }
    @objc func doneAction() {
        navigationController?.popViewController(animated: true)
        
    }

    @objc func cancelAction() {
        navigationController?.popViewController(animated: true)
    }
}
