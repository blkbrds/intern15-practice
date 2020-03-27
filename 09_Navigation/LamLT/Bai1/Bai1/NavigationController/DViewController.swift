

import UIKit

class DViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction private func pushToEViewControllerTouchUpInside(_ sender: Any) {
           let eVC = EViewController()
           self.navigationController?.pushViewController(eVC, animated: true)
    }
    
    @IBAction private func popToBViewControllerTouchUpInside(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[1])!
        navigationController?.popToViewController(vc, animated: true)
    }

    @IBAction private func popToCViewControllerTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction private func rootToAViewCOntrollerTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
