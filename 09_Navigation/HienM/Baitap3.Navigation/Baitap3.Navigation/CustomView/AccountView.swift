import SwiftUI

protocol UserViewDeligate: class {
	func view(view: UIViewController, value: String)
}

class AccountView: UIView {

	weak var delegate: UserViewDeligate?

	@IBOutlet weak var userImage: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!

	override init(frame: CGRect) {
		super.init(frame: frame)
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)

	}
	@IBAction func tap (_ sender: Any) {
		delegate?.view(view: SecondViewController(), value: self.nameLabel.text ?? "")
	}
}
