import UIKit

final class SecondViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Home"
		let rightButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(rightAction))
		navigationItem.rightBarButtonItem = rightButton
		
		let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(leftAction))
		navigationItem.leftBarButtonItem = backButton
	}
	
	@objc func rightAction() {
		let vc = ThreeViewController()
		navigationController?.pushViewController(vc, animated: true)
	}
	
	@objc func leftAction() {
		navigationController?.popViewController(animated: true)
	}
}
