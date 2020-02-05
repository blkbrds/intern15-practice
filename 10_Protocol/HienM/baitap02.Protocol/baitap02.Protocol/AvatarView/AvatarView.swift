import SwiftUI
protocol AvatarViewDeligate: class {
	func view(view: AvatarView, needPerformAction action: AvatarView.Action)
}

class AvatarView: UIView {

	var name: String? {
		didSet {
			nameLabel.text = name
		}
	}
	weak var delegate: AvatarViewDeligate?

	@IBOutlet weak var avatarImage: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!

	enum Action {
		case nameUser (nameUser: String?)
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}

	@IBAction func tap (_ sender: Any) {
		delegate?.view(view: self, needPerformAction: .nameUser(nameUser: name))
	}
}
