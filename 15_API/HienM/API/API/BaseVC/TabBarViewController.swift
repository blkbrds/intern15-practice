import UIKit

final class TabBarViewController: UITabBarController {

	override func viewDidLoad() {
		super.viewDidLoad()
		setupTabBar()
	}
	
	private func setupTabBar() {
		let HomeVC = HomeViewController()
		let HomeNavi = UINavigationController(rootViewController: HomeVC)
		let SearchVC = SearchViewController()
		let SearchNavi = UINavigationController(rootViewController: SearchVC)
		let FavoriteVC = FavoriteViewController()
		let FavoriteNavi = UINavigationController(rootViewController: FavoriteVC)
		HomeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
		SearchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "search"), tag: 1)
		FavoriteVC.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(named: "favorite"), tag: 2)
		self.viewControllers = [HomeNavi,SearchNavi,FavoriteNavi]
		self.selectedIndex = 0
		self.tabBar.unselectedItemTintColor = .black
		self.tabBar.tintColor = .blue
		
		let appearance = UITabBarItem.appearance()
		appearance.setBadgeTextAttributes([NSAttributedString.Key.strokeColor: UIColor.systemPink], for: .normal)
		appearance.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)], for: .normal)
	}
}
