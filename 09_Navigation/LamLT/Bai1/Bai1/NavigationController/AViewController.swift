import UIKit

class AViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction private func pushToViewBButtonTouchUpSide(_ sender: Any) {
        let bViewController = BViewController()
        navigationController?.pushViewController(bViewController, animated: true)
    }


}
