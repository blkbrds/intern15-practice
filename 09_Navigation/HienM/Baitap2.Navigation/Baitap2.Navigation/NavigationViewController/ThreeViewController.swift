import UIKit

final class ThreeViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Edit"

		let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneAction))
		navigationItem.rightBarButtonItem = rightButton

		let leftButton = UIBarButtonItem(title: "Cannel", style: .plain, target: self, action: #selector(doneAction))
		navigationItem.leftBarButtonItem = leftButton
	}

	@objc func doneAction() {
		navigationController?.popViewController(animated: true)
	}
}
