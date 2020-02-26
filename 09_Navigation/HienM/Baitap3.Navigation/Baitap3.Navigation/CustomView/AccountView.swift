import SwiftUI

protocol AccountViewDelegate: class {
	func AccountView(viewController: UIViewController, value: String)
}

class AccountView: UIView {

	weak var delegate: AccountViewDelegate?

	@IBOutlet weak var userImage: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!

	override init(frame: CGRect) {
		super.init(frame: frame)
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)

	}
	@IBAction func tap (_ sender: Any) {
		delegate?.AccountView(viewController: SecondViewController(), value: self.nameLabel.text ?? "")
	}
}
