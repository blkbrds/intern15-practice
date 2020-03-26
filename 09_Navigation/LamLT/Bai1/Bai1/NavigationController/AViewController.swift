import UIKit

class AViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction private func pushToBViewController(_ sender: Any) {
        let bViewControl = BViewController()
        navigationController?.pushViewController(bViewControl, animated: true)
    }


}
