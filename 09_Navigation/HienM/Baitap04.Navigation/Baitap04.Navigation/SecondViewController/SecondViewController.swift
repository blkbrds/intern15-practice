import UIKit

class SecondViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Home"
		navigationController?.navigationBar.barTintColor = .systemRed
	}
	
	@objc func pushUpOutsideSecondView() {
		navigationController?.popViewController(animated: true)
	}
}
