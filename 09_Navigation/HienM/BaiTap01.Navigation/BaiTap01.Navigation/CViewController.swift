import UIKit

final class CViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	@IBAction private func pushToDViewController(_ sender: Any) {
		let vc = DViewController()
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
	@IBAction private func popToBViewController(_ sender: Any) {
		navigationController?.popViewController(animated: true)
	}
	
	@IBAction private func rootToAViewController(_ sender: Any) {
		navigationController?.popToRootViewController(animated: true)
	}
	
}
