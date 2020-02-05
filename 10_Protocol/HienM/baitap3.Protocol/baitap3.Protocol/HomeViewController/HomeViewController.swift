import UIKit

protocol HomeViewDataSource {
	func viewController(viewController: HomeViewController ) -> String
}

class HomeViewController: UIViewController {

	var dataSource: HomeViewDataSource?
	
	@IBOutlet weak var districtLabel: UILabel!
	@IBOutlet weak var localLabel: UILabel!
	@IBOutlet weak var provinceLabel: UILabel!
	override func viewDidLoad() {

		super.viewDidLoad()

		makeBorder()
		title = "Location"

		let rightButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(pushToViewController))
		navigationItem.rightBarButtonItem = rightButton
		

		func configView() {
				if let dataSource = dataSource {
					
					localLabel.text = dataSource.viewController(viewController: self)
				}
			}
		
	}
	func makeBorder() {
		districtLabel.layer.borderColor = UIColor.orange.cgColor
		districtLabel.layer.borderWidth = 1
		localLabel.layer.borderColor = UIColor.blue.cgColor
		localLabel.layer.borderWidth = 1
		provinceLabel.layer.borderColor = UIColor.green.cgColor
		provinceLabel.layer.borderWidth = 1

	}
	@objc func pushToViewController() {
		let vc = LocalViewController()
		navigationController?.pushViewController(vc, animated: true)
		
	}
}

