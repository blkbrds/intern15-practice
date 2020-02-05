import UIKit


class LocalViewController: UIViewController {

	@IBOutlet var mienButtons: [UIButton]!


	var name: String?


	override func viewDidLoad() {
		super.viewDidLoad()

		title = "Local"

		let rightButton = UIBarButtonItem(title: "Province", style: .plain, target: self, action: #selector(pushToProvinceViewController))
		navigationItem.rightBarButtonItem = rightButton

		let backButton = UIBarButtonItem(image: UIImage(named: "back arrow"), style: .plain, target: self, action: #selector(backToHomeViewController))
		navigationItem.leftBarButtonItem = backButton
		let homeViewController = HomeViewController()
		homeViewController.dataSource = self

	}

	@objc func pushToProvinceViewController() {
		let vc = ProvinceViewController()
		navigationController?.pushViewController(vc, animated: true)
	}

	@objc func backToHomeViewController() {
		navigationController?.popViewController(animated: true)
	}

	@IBAction func getLocalAction(_ sender: UIButton) {
		mienButtons.forEach({ $0.backgroundColor = .gray })
		sender.backgroundColor = .yellow
		name = sender.titleLabel?.text

	}
}
extension LocalViewController: HomeViewDataSource {
	func viewController(viewController: HomeViewController) -> String {
		guard let nameText = name else { return name ?? ""}

		return nameText
	}
}


