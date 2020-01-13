
import UIKit

class ReadNewViewController: UIViewController {
	@IBOutlet weak var backImageButton: UIButton!
	@IBOutlet weak var nextImageButton: UIButton!
	@IBOutlet weak var likeButton: UIButton!
	@IBOutlet weak var commentButton: UIButton!
	@IBOutlet weak var shareButton: UIButton!
	@IBOutlet weak var contentTextView: UITextView!
	@IBOutlet weak var contentImageView: UIImageView!

	let images:  [String] = ["casau", "chuotchui", "doi", "lacda", "tho"]
	let content: [String] = []
	

	override func viewDidLoad() {
		super.viewDidLoad()

	}

}
