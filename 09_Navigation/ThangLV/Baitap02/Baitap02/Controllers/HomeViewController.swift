import UIKit

protocol HomeViewcontrollerDelegate: class {
    func removeDataOfTextField()
}

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var delegate: HomeViewcontrollerDelegate?
    var editViewController = EditViewController()
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(touchUpInsideLogoutButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(touchUpInsideEditButton))
        welcomeLabel.text = name ?? ""
    }
    
    @objc func touchUpInsideLogoutButton() {
        navigationController?.popViewController(animated: true)
        delegate?.removeDataOfTextField()
    }
    
    @objc func touchUpInsideEditButton() {
        let editViewController = EditViewController()
        navigationController?.pushViewController(editViewController, animated: true)
        editViewController.delegate = self as EditViewControllerDelegate
    }
}

extension HomeViewController: EditViewControllerDelegate {
    func updateDataToHomePage(name: String) {
        self.welcomeLabel.text = "Welcome \(name)!"
    }
}

extension HomeViewController: LoginViewControllerDelegate {
    func showGrettingForUser(name: String) {
        welcomeLabel.text = name
    }
}


