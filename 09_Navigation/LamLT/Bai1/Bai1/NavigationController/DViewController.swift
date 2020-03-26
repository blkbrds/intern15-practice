

import UIKit

class DViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction private func pushToEViewController(_ sender: Any) {
           let EViewControl = EViewController()
           self.navigationController?.pushViewController(EViewControl, animated: true)
    }
    
    @IBAction private func popToBViewController(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[1])!
        navigationController?.popToViewController(vc, animated: true)
    }

    @IBAction private func popToCViewController(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction private func rootToAViewCOntroller(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }


}
