import UIKit

class BViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction private func pushToCviewController(_ sender: Any) {
        let nextCVC = CViewController()
        navigationController?.pushViewController(nextCVC, animated: true)
    }

    @IBAction private func backToAViewController(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
