import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeTextLine: UILabel!
    var calLogin = LoginViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        let rightButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(rightAction))
        navigationItem.rightBarButtonItem = rightButton
        
        let backButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(leftAction))
        navigationItem.leftBarButtonItem = backButton
        homeTextLine.text = "Welcome \(calLogin.userName)"
    }
    
    @objc func rightAction() {
        let editView = EditViewController()
        navigationController?.pushViewController(editView, animated: true)
    }
    
    @objc func leftAction() {
        navigationController?.popViewController(animated: true)
    }
}
