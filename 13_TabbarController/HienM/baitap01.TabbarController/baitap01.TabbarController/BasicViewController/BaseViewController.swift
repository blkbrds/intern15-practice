import UIKit

class BaseViewController: UIViewController {

	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
	}

	func setupUI() {
		setupTabBar()
	}

	private func setupTabBar() {
		self.tabBarItem.badgeColor = .blue
	}
}
