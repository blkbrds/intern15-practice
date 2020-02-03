import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    static let shared: SceneDelegate = {
        guard let shared = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
            fatalError("Cannot cast `UIApplication.shared.delegate` to `AppDelegate`.")
        }
        return shared
    }()
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let loginViewController = LoginViewController()
        configRootView(loginViewController, scene)
    }
    
    func configRootView(_ viewController: UIViewController, _ scene: UIScene) {
            guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        changeRootView(viewController)
        window?.makeKeyAndVisible()
    }
}

extension SceneDelegate {
    func changeRootView(_ viewController: UIViewController) {
        let navi = UINavigationController(rootViewController: viewController)
        navi.isNavigationBarHidden = true
        window?.rootViewController = navi
    }
}

