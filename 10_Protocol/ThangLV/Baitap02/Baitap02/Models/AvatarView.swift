import UIKit

protocol AvatarViewDelegate: class {
    func view(view: AvatarView, needPerform action: AvatarView.Action)
}

final class AvatarView: UIView {
    
    enum Action {
        case tapOnUserNameImage(name: String, image: UIImageView)
    }

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!

    weak var delegate: AvatarViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    @IBAction private func tapOnAvatarView(_ sender: Any) {
        guard let userName = userNameLabel.text, let userImage = userImageView else { return }
        delegate?.view(view: self, needPerform: AvatarView.Action.tapOnUserNameImage(name: userName, image: userImage))
    }
}
