import SwiftUI

protocol AccountViewDelegate: class {
	func accountView(viewController: UIViewController, value: String)
}

final class AccountView: UIView {

	weak var delegate: AccountViewDelegate?

	@IBOutlet weak var userImage: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!

	override init(frame: CGRect) {
		super.init(frame: frame)
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)

	}
	@IBAction private func avatarButtonTouchUpInside (_ sender: Any) {
		if let delegate = delegate {
			delegate.accountView(viewController: SecondViewController(), value: self.nameLabel.text ?? "")
		}
	}
}
