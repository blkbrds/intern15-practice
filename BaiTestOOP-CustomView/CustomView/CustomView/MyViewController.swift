
import UIKit

class MyViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		let userView = Bundle.main.loadNibNamed("FavoriteView", owner: self, options: nil)?.first as? FavoriteView
		let frame = CGRect(x: 80, y: 300, width: 255, height: 388)
		userView?.frame = frame
		view.addSubview(userView!)
	}

}
