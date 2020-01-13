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

	@IBAction func actionPinkButton(_ sender: Any) {

	self.view.addConstraint(NSLayoutConstraint(item: pinkButton as Any, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: blueButton, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1.0, constant: 0.0))
//
		//self.view.addConstraint(NSLayoutConstraint(item: blueButton as Any, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: pinkButton, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1.0, constant: 0.0))
//
		//	self.view.addConstraint(NSLayoutConstraint(item: pinkButton as Any, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: blueButton, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: 0.0))
	}

}
