import UIKit

class CViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction private func pushToDViewController(_ sender: Any) {
        let DViewControl = DViewController()
        self.navigationController?.pushViewController(DViewControl, animated: true)
    }
    
    @IBAction private func popToBViewController(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func rootToAViewController(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
