import UIKit

protocol HomeViewcontrollerDelegate: class {
    func viewController(viewController: HomeViewController, needPerform action: HomeViewController.Action)
}

class HomeViewController: UIViewController {

    enum Action {
        case removeDataOfTextField
    }

    @IBOutlet private weak var welcomeLabel: UILabel!

    weak var delegate: HomeViewcontrollerDelegate?
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
        let homeViewController = HomeViewController()
        delegate?.viewController(viewController: homeViewController, needPerform: HomeViewController.Action.removeDataOfTextField)
    }

    @objc func touchUpInsideEditButton() {
        let editViewController = EditViewController()
        navigationController?.pushViewController(editViewController, animated: true)
        editViewController.delegate = self as EditViewControllerDelegate
    }
}

extension HomeViewController: EditViewControllerDelegate {
    func viewController(viewController: EditViewController, needPerform action: EditViewController.Action) {
        switch action {
        case .updateDataToHomePage(let name):
            welcomeLabel.text = "Welcome \(name)!"
        }
    }
}

extension HomeViewController: LoginViewControllerDelegate {
    func viewController(viewController: LoginViewController, needPerform action: LoginViewController.Action) {
        switch action {
        case .showGrettingForUser(let name):
            welcomeLabel.text = name
        }
    }
}

