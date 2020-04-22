import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    var userName: String = ""
    var password: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        let rightButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(rightButtonTouchUpInside))
        navigationItem.rightBarButtonItem = rightButton
        
        let backButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(leftButtonTouchUpInSide))
        navigationItem.leftBarButtonItem = backButton
        userNameLabel.text = "Welcome \(userName)"
    }
    
    @objc func rightButtonTouchUpInside() {
        let editViewController = EditViewController()
        editViewController.userName = userName
        editViewController.password = password
        editViewController.delegate = self
        navigationController?.pushViewController(editViewController, animated: true)
    }
    
    @objc func leftButtonTouchUpInSide() {
        navigationController?.popViewController(animated: true)
    }
}

extension HomeViewController: EditViewControllerDelegate {
    func controller(controller: EditViewController, needPerformAction action: EditViewController.Action) {
        switch action {
        case .updateUI(let userName, let password):
            guard let userName = userName, let password = password else { return }
            self.userName = userName
            self.password = password
            userNameLabel.text = "Welcome \(self.userName)"
        }
    }
}
