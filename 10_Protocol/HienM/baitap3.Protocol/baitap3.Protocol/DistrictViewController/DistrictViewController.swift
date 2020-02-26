import UIKit

class DistrictViewController: BaseViewController {

	var diaDiem: DiaDiem = DiaDiem()
	var huyen: String?
	var tinh: String?
	var mien: String?

	@IBOutlet private var huyenButton: [UIButton]!
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	override func setupNavigationBar() {

		title = "District"

		let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(rootToHomeViewController))
		navigationItem.rightBarButtonItem = rightButton

		let backButton = UIBarButtonItem(image: UIImage(named: "back arrow"), style: .plain, target: self, action: #selector(backToProvinceViewController))
		navigationItem.leftBarButtonItem = backButton
	}

	@objc private func backToProvinceViewController() {
		navigationController?.popViewController(animated: true)
	}

	@IBAction private func getDistrictAction(_ sender: UIButton) {
		huyenButton.forEach({ $0.backgroundColor = .gray })
		sender.backgroundColor = .orange
		diaDiem.huyen = sender.titleLabel?.text ?? ""
	}

	@objc private func rootToHomeViewController() {
		huyen = diaDiem.huyen
		tinh = diaDiem.tinh
		mien = diaDiem.mien
		
		guard let navi = navigationController else { return }
		for vc in navi.viewControllers where vc is HomeViewController {
			let locationVC = vc as! HomeViewController
			locationVC.dataSource = self
			locationVC.configViewController()
			navi.popToViewController(locationVC, animated: true)
		}
	}
}

extension DistrictViewController: HomeViewControllerDataSource {
	func getHuyen() -> String? {
		guard let huyen = huyen else {return ""}
		return huyen
	}

	func getTinh() -> String? {
		guard let tinh = tinh else {return ""}
		return tinh
	}

	func getMien() -> String? {
		guard let mien = mien else {return ""}
		return mien
	}
}
