import UIKit

struct DiaDiem {
	var local: String = ""
	var province: String = ""
	var district: String = ""
}

final class LocalViewController: BaseViewController {

	@IBOutlet private var localButtons: [UIButton]!

	var diaDiem: DiaDiem = DiaDiem()

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func setupNavigationBar() {
		title = "Local"

		let rightButton = UIBarButtonItem(title: "Province", style: .plain, target: self, action: #selector(rightBarButtonTouchUpInside))
		navigationItem.rightBarButtonItem = rightButton

		let backButton = UIBarButtonItem(image: UIImage(named: "back arrow"), style: .plain, target: self, action: #selector(leftBarButtonTouchUpInside))
		navigationItem.leftBarButtonItem = backButton

	}

	@objc private func rightBarButtonTouchUpInside() {
		let provinceViewController = ProvinceViewController()
		provinceViewController.diaDiem = diaDiem
		navigationController?.pushViewController(provinceViewController, animated: true)
	}

	@objc private func leftBarButtonTouchUpInside() {
		guard let navi = navigationController else { return }
		for vc in navi.viewControllers where vc is HomeViewController {
			guard let homeVC = vc as? HomeViewController else { return }
			navi.popToViewController(homeVC, animated: true)
		}
	}

	@IBAction private func getLocalButtonTouchInside(_ sender: UIButton) {
		localButtons.forEach({ $0.backgroundColor = .gray })
		sender.backgroundColor = .blue
		guard let titleText = sender.titleLabel?.text else { return }
		diaDiem.local = titleText
	}
}

