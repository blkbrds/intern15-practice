import UIKit

class CViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	@IBAction func push(_ sender: Any) {
		let vc = DViewController()
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
	@IBAction func pop(_ sender: Any) {
		navigationController?.popViewController(animated: true)
	}
	
	@IBAction func root(_ sender: Any) {
		navigationController?.popToRootViewController(animated: true)
	}
	
}
