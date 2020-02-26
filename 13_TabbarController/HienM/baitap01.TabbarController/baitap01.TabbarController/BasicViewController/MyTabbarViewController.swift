import UIKit

class MyTabbarViewController: UITabBarController, UITabBarControllerDelegate {

	override func viewDidLoad() {
		super.viewDidLoad()
		setupTabBar()

	}

	func setupTabBar() {
		let homeVC = HomeViewController()
		let messagerVC = MessagerViewController()
		let friendVC = FriendViewController()
		let profileVC = ProfileViewController()
		
		homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
		messagerVC.tabBarItem = UITabBarItem(title: "Messager", image: UIImage(named: "message"), tag: 1)
		friendVC.tabBarItem = UITabBarItem(title: "Friend", image: UIImage(named: "heart"), tag: 2)
		profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "user"), tag: 3)
		
		let homeNavi = UINavigationController(rootViewController: homeVC)
		self.viewControllers = [homeNavi, messagerVC, friendVC, profileVC]
		self.selectedIndex = 0
		self.tabBar.backgroundImage = UIImage(named: "223993")
		self.tabBar.tintColor = .cyan
		self.tabBar.unselectedItemTintColor = .red
		let appearance = UITabBarItem.appearance()
		appearance.setBadgeTextAttributes([NSAttributedString.Key.strokeColor: UIColor.systemPink], for: .normal)
		appearance.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)], for: .normal)
	}

}
