import UIKit

final class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        let lougoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonTouchUpInside))
        navigationItem.rightBarButtonItem = lougoutButton
    }
    
    @objc func logoutButtonTouchUpInside() {
        SceneDelegate.shared.navigationController()
    }
}
