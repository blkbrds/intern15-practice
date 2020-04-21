import UIKit

class DViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction private func pushToEButtonTouchUpInside(_ sender: Any) {
           let eVC = EViewController()
           self.navigationController?.pushViewController(eVC, animated: true)
    }
    
    @IBAction private func popToBButtonTouchUpInside(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[1])!
        navigationController?.popToViewController(vc, animated: true)
    }

    @IBAction private func popToCButtonTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction private func rootToAButtonTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
