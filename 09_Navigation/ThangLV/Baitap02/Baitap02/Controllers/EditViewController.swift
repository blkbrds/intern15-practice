import UIKit

protocol EditViewControllerDelegate: class {
    func viewController(viewController: EditViewController, needPerform action: EditViewController.Action)
}

class EditViewController: UIViewController {
    
    enum Action {
       case updateDataToHomePage(name: String)
    }
    
    @IBOutlet private weak var userNameTextField: UITextField!
    
    weak var delegate: EditViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(touchUpInsideCancelButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(touchUpInsideDoneButton))
    }
    
    @objc func touchUpInsideCancelButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func touchUpInsideDoneButton() {
        navigationController?.popViewController(animated: true)
        guard let userName = userNameTextField.text else { return }
        let editViewController = EditViewController()
        delegate?.viewController(viewController: editViewController, needPerform: EditViewController.Action.updateDataToHomePage(name: userName))
    }
}
