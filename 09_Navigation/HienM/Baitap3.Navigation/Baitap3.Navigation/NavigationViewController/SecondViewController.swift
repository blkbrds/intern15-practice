import UIKit

final class SecondViewController: UIViewController {

	@IBOutlet weak private var accountImageView: UIImageView!
	@IBOutlet weak private var userNameLabel: UILabel!

	var name: String = ""

	override func viewDidLoad() {
		super.viewDidLoad()

		title = "Profile"
		let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(popToFirstViewController
			))
		navigationItem.rightBarButtonItem = rightButton
		userNameLabel.text = name
	}

	@objc private func popToFirstViewController() {
		navigationController?.popViewController(animated: true)
	}
}
