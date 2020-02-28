import UIKit

final class CViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	@IBAction private func push(_ sender: Any) {
		let vc = DViewController()
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
	@IBAction private func pop(_ sender: Any) {
		navigationController?.popViewController(animated: true)
	}
	
	@IBAction private func root(_ sender: Any) {
		navigationController?.popToRootViewController(animated: true)
	}
	
}
