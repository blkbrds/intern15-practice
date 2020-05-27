import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    static let shared: SceneDelegate = {
        guard let shared = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
            fatalError("Cannot cast `UIApplication.shared.delegate` to `AppDelegate`.")
        }
        return shared
    }()
    
    enum TypeScreen {
        case login
        case tabbar
    }
    
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)

        self.window = window
        window.makeKeyAndVisible()

        changeScreen(type: .login)
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }

    func tabBarController() {
        let homeVC = HomeViewController()
        let homeNavi = UINavigationController(rootViewController: homeVC)
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)

        let mapVC = MapViewController()
        let mapNavi = UINavigationController(rootViewController: mapVC)
        mapVC.tabBarItem = UITabBarItem(title: "Map", image: UIImage(named: "map"), tag: 1)

        let favortiesVC = FavortiesViewController()
        let favortiesNavi = UINavigationController(rootViewController: favortiesVC)
        favortiesVC.tabBarItem = UITabBarItem(title: "Favorties", image: UIImage(named: "favorites"), tag: 2)

        let profileVC = ProfileViewController()
        let profileNavi = UINavigationController(rootViewController: profileVC)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "users"), tag: 3)

        let tabbarController = UITabBarController()
        tabbarController.viewControllers = [homeNavi, mapNavi, favortiesNavi, profileNavi]
        tabbarController.tabBar.tintColor = .red
        tabbarController.tabBar.backgroundImage = UIImage(named: "CM    ")
        window?.rootViewController = tabbarController
    }

    func navigationController() {
        let loginVC = LoginViewController()
        let navi = BaseNavigationController(rootViewController: loginVC)
        window?.rootViewController = navi
    }
    
    func changeScreen(type: TypeScreen) {
        switch type {
        case .login:
            navigationController()
        default:
            tabBarController()
        }
    }
}
