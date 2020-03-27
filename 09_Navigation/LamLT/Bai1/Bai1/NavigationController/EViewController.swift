

import UIKit

class EViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction private func popToBViewControllerTouchUpInside(_ sender: Any) {
        let backToB = (self.navigationController?.viewControllers[1])!
        navigationController?.popToViewController(backToB, animated: true)
    }

    @IBAction private func popToCViewControllerTouchUpInside(_ sender: Any) {
        let backToC = (self.navigationController?.viewControllers[2])!
        navigationController?.popToViewController(backToC, animated: true)
    }
    
    @IBAction private func popToDViewControllerTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction private func rootToAViewCOntrollerTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }


}
