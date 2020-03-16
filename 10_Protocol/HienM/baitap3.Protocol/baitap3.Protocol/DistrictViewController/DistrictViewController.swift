import UIKit

final class DistrictViewController: BaseViewController {

	var diaDiem: DiaDiem = DiaDiem()
	var district: String?
	var province: String?
	var local: String?

	@IBOutlet private var districtButton: [UIButton]!
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	override func setupNavigationBar() {

		title = "District"

		let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(backToHomeViewControllerTouchUpInside))
		navigationItem.rightBarButtonItem = rightButton

		let backButton = UIBarButtonItem(image: UIImage(named: "back arrow"), style: .plain, target: self, action: #selector(backToProvinceViewController))
		navigationItem.leftBarButtonItem = backButton
	}

	@objc private func backToProvinceViewController() {
		navigationController?.popViewController(animated: true)
	}

	@IBAction private func getDistrictButtonTouchUpInside(_ sender: UIButton) {
		districtButton.forEach({ $0.backgroundColor = .gray })
		sender.backgroundColor = .orange
		diaDiem.district = sender.titleLabel?.text ?? ""
	}

	@objc private func backToHomeViewControllerTouchUpInside() {
		district = diaDiem.district
		province = diaDiem.province
		local = diaDiem.local

		guard let navi = navigationController else { return }
		for vc in navi.viewControllers where vc is HomeViewController {
			guard let locationVC = vc as? HomeViewController else {return}
			locationVC.dataSource = self
			locationVC.configViewController()
			navi.popToViewController(locationVC, animated: true)
		}
	}
}

extension DistrictViewController: HomeViewControllerDataSource {
	func getDistrict() -> String? {
		guard let district = district else { return "" }
		return district
	}

	func getProvince() -> String? {
		guard let province = province else { return "" }
		return province
	}

	func getLocal() -> String? {
		guard let local = local else { return "" }
		return local
	}
}
