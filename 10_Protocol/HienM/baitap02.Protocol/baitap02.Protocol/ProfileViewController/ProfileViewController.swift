import UIKit

protocol ProfileViewControllerDelegate: class {
	func controller(controller: ProfileViewController, needPerformAction action: ProfileViewController.Action)
}

final class ProfileViewController: UIViewController {

	@IBOutlet weak var avatarImage: UIImageView!
	@IBOutlet weak var userNameTextField: UITextField!
	
	var delegate: ProfileViewControllerDelegate?
	var name: String = ""
	
	enum Action {
		case updateName(nameUser: String)
	
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()

		title = "Profile"
		let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(pop
			))
		navigationItem.rightBarButtonItem = rightButton
		userNameTextField.text = name
	
	}

	@objc func pop() {
		navigationController?.popViewController(animated: true)
		name = userNameTextField.text ?? ""
		delegate?.controller(controller: self, needPerformAction: .updateName(nameUser: name))
		print(name)
	
	}
}

