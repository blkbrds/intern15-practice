import UIKit

class CViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction private func pushToDButtonTouchUpInside(_ sender: Any) {
        let dVC = DViewController()
        self.navigationController?.pushViewController(dVC, animated: true)
    }
    
    @IBAction private func popToBButtonTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func rootToAButtonTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
