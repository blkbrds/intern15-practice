import UIKit

class CViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction private func pushToDViewControllerTouchUpInside(_ sender: Any) {
        let dVC = DViewController()
        self.navigationController?.pushViewController(dVC, animated: true)
    }
    
    @IBAction private func popToBViewControllerTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func rootToAViewControllerTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
