import UIKit

class BViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction private func pushToViewCButtonTouchUpSide(_ sender: Any) {
        let nextCVC = CViewController()
        navigationController?.pushViewController(nextCVC, animated: true)
    }

    @IBAction private func backToAViewButtonTouchUpSide(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
