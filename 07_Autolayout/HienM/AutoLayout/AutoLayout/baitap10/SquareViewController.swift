import UIKit

class SquareViewController: UIViewController {
	@IBOutlet weak var blueButton: UIButton!
	@IBOutlet weak var pinkButton: UIButton!
	@IBOutlet weak var brownButton: UIButton!
	@IBOutlet weak var greenButton: UIButton!
	@IBOutlet weak var orangesButton: UIButton!
	override func viewDidLoad() {
		super.viewDidLoad()

	}
	let CGsizeBig = CGSize(width: 160, height: 160)
	let CGsizeSmall = CGSize(width: 80, height: 80)

	@IBAction func actionPinkButton(_ sender: UIButton) {
		UIView.animate(withDuration: 1) {
			
		}
	}

}
