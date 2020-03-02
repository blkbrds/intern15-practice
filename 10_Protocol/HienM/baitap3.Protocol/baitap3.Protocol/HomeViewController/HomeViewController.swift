import UIKit

protocol HomeViewControllerDataSource: class {
	func getDistrict () -> String?
	func getProvince () -> String?
	func getLocal () -> String?
}

final class HomeViewController: BaseViewController {

	weak var dataSource: HomeViewControllerDataSource?

	@IBOutlet private weak var districtLabel: UILabel!
	@IBOutlet private weak var localLabel: UILabel!
	@IBOutlet private weak var provinceLabel: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Location"

		let rightButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(rightButtonTouchUpInside))
		navigationItem.rightBarButtonItem = rightButton
	}

	func configViewController () {
		guard let distrirtText = dataSource?.getDistrict(), let provinceText = dataSource?.getProvince(), let localText = dataSource?.getLocal() else { return }
		districtLabel.text = distrirtText
		localLabel.text = localText
		provinceLabel.text = provinceText
	}

	override func setupNavigationBar() {
		title = "Địa điểm"
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(handleEditButtonTouchUpInside))
	}

	@objc private func rightButtonTouchUpInside() {
		let localVC = LocalViewController()
		navigationController?.pushViewController(localVC, animated: true)
	}

	@objc private func handleEditButtonTouchUpInside() {
		let localViewController = LocalViewController()
		navigationController?.pushViewController(localViewController, animated: true)
	}
}
