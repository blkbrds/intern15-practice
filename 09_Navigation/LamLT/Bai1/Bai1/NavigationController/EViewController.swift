

import UIKit

class EViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction private func popToBViewController(_ sender: Any) {
        let backToB = (self.navigationController?.viewControllers[1])!
        navigationController?.popToViewController(backToB, animated: true)
    }

    @IBAction private func popToCViewController(_ sender: Any) {
        let backToC = (self.navigationController?.viewControllers[2])!
        navigationController?.popToViewController(backToC, animated: true)
    }
    
    @IBAction private func popToDViewController(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction private func rootToAViewCOntroller(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }


}
