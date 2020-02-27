import SwiftUI

protocol AvatarViewDelegate: class {
	func avatarView(view: AvatarView, needPerformAction action: AvatarView.Action)
}

final class AvatarView: UIView {

	var name: String? {
		didSet {
			nameLabel.text = name
		}
	}
	weak var delegate: AvatarViewDelegate?

	@IBOutlet weak private var avatarImage: UIImageView!
	@IBOutlet weak private var nameLabel: UILabel!

	enum Action {
		case nameUser (nameUser: String?)
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}

	@IBAction private func printNameButtonTouchUpInside (_ sender: Any) {
		if let delegate = delegate {
			delegate.avatarView(view: self, needPerformAction: .nameUser(nameUser: name))
		}
	}
}
