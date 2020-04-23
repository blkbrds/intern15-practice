

import UIKit

class EViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction private func popToBButtonTouchUpInside(_ sender: Any) {
        let backToB = (self.navigationController?.viewControllers[1])!
        navigationController?.popToViewController(backToB, animated: true)
    }

    @IBAction private func popToCButtonTouchUpInside(_ sender: Any) {
        let backToC = (self.navigationController?.viewControllers[2])!
        navigationController?.popToViewController(backToC, animated: true)
    }
    
    @IBAction private func popToDButtonTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction private func rootToAButtonTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }


}
