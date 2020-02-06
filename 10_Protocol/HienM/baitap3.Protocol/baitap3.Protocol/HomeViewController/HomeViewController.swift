import UIKit
protocol HomeViewControllerDataSource: class {
	func getHuyen () -> String?
	func getTinh () -> String?
	func getMien () -> String?
}

class HomeViewController: BaseViewController {

	var dataSource: HomeViewControllerDataSource?

	@IBOutlet private weak var districtLabel: UILabel!
	@IBOutlet private weak var localLabel: UILabel!
	@IBOutlet private weak var provinceLabel: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Location"

		let rightButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(pushToViewController))
		navigationItem.rightBarButtonItem = rightButton
	}
	
	func configViewController () {
		guard let huyenText = dataSource?.getHuyen(), let tinhText = dataSource?.getTinh(), let mienText = dataSource?.getMien() else { return }
		districtLabel.text = huyenText
		localLabel.text = mienText
		provinceLabel.text = tinhText
	}
	
	override func setupNavigationBar() {
		title = "Địa điểm"
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(handleEdit))
	}

	@objc private func pushToViewController() {
		let vc = LocalViewController()
		navigationController?.pushViewController(vc, animated: true)
	}

	@objc private func handleEdit() {
		let localViewController = LocalViewController()
		navigationController?.pushViewController(localViewController, animated: true)
	}
}
