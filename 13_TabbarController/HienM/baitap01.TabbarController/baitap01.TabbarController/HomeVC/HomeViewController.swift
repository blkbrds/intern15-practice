import UIKit

final class HomeViewController: BaseViewController {

	@IBOutlet weak var imageView: UIImageView!
	
	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func setupUI() {
		super.setupUI()
		title = "Home"
	}
}
