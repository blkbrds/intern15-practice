
import UIKit

final class NavigationViewController: UIViewController {

	@IBOutlet weak private var nameLabel: UILabel!

	var nameText: String?

	override func viewDidLoad() {
		super.viewDidLoad()
		nameLabel.text = nameText
	}
}
