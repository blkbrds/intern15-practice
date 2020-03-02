import UIKit

final class ProvinceViewController: BaseViewController {

	@IBOutlet private var provinceButton: [UIButton]!
	var diaDiem: DiaDiem = DiaDiem()

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func setupNavigationBar() {
		title = "Province"

		let rightButton = UIBarButtonItem(title: "District", style: .plain, target: self, action: #selector(rightButtonTouchUpInside))
		navigationItem.rightBarButtonItem = rightButton

		let backButton = UIBarButtonItem(image: UIImage(named: "back arrow"), style: .plain, target: self, action: #selector(leftButtonTouchUpInside))
		navigationItem.leftBarButtonItem = backButton
	}

	@objc private func rightButtonTouchUpInside() {
		let vc = DistrictViewController()
		vc.diaDiem = diaDiem
		navigationController?.pushViewController(vc, animated: true)
	}

	@objc private func leftButtonTouchUpInside() {
		navigationController?.popViewController(animated: true)
	}

	@IBAction private func getProvinceTouchUpInside(_ sender: UIButton) {
		provinceButton.forEach({ $0.backgroundColor = .gray })
		sender.backgroundColor = .green
		diaDiem.province = sender.titleLabel?.text ?? ""
	}
}
