import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

		guard let windowSence = (scene as? UIWindowScene) else { return }
		let window = UIWindow(windowScene: windowSence)

		let vc = HomeViewController()
		let navi = UINavigationController(rootViewController: vc)
		window.rootViewController = navi

		self.window = window
		window.makeKeyAndVisible()
	}
}

