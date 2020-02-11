
import UIKit

class NavigationViewController: UIViewController {
	@IBOutlet weak var nameLabel: UILabel!
	
	var nameText: String?

	override func viewDidLoad() {
		super.viewDidLoad()
		nameLabel.text = nameText
	}



}
