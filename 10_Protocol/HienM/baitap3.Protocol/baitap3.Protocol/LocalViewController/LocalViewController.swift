import UIKit
struct DiaDiem {
	var mien: String = ""
	var tinh: String = ""
	var huyen: String = ""
}

final class LocalViewController: BaseViewController {

	@IBOutlet private var mienButtons: [UIButton]!

	var diaDiem: DiaDiem = DiaDiem()

	enum Action {
		case NameLocal (nameLocal: String?)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func setupNavigationBar() {
		title = "Local"

		let rightButton = UIBarButtonItem(title: "Province", style: .plain, target: self, action: #selector(pushToProvinceViewController))
		navigationItem.rightBarButtonItem = rightButton

		let backButton = UIBarButtonItem(image: UIImage(named: "back arrow"), style: .plain, target: self, action: #selector(backToHomeViewController))
		navigationItem.leftBarButtonItem = backButton

	}

	@objc private func pushToProvinceViewController() {
		let provinceViewController = ProvinceViewController()
		provinceViewController.diaDiem = diaDiem
		navigationController?.pushViewController(provinceViewController, animated: true)
	}

	@objc private func backToHomeViewController() {
		guard let navi = navigationController else { return }
		for vc in navi.viewControllers where vc is HomeViewController {
			let homeVC = vc as! HomeViewController
			navi.popToViewController(homeVC, animated: true)
		}
	}

	@IBAction private func getLocalAction(_ sender: UIButton) {
		mienButtons.forEach({ $0.backgroundColor = .gray })
		sender.backgroundColor = .blue
		diaDiem.mien = sender.titleLabel?.text ?? ""
	}
}

