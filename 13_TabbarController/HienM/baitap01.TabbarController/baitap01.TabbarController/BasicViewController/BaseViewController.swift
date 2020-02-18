
import UIKit

class BaseViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
	}
	
	func setupUI() {
		setupTabBar()
	}
	
	func setupTabBar() {
		self.tabBarItem.badgeColor = .blue
	}

}
