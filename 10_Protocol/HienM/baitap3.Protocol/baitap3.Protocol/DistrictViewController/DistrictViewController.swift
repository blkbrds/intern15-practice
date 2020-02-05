
import UIKit

class DistrictViewController: UIViewController {

	@IBOutlet var huyenButton: [UIButton]!
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "District"

		let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(rootToHomeViewController))
		navigationItem.rightBarButtonItem = rightButton
		
		let backButton = UIBarButtonItem(image: UIImage(named: "back arrow"), style: .plain, target: self, action: #selector(backToProvinceViewController))
		navigationItem.leftBarButtonItem = backButton
	}
	@objc func	rootToHomeViewController() {
		navigationController?.popToRootViewController(animated: true)
	}

	@objc func backToProvinceViewController() {
		navigationController?.popViewController(animated: true)
	}
}
