import UIKit

protocol AvatarViewDelegate: class {
    func view(view: AvatarView, needPerform action: AvatarView.Action)
}

class AvatarView: UIView {
    
    enum Action {
        case tapOnUserNameImage(name: String)
    }
    
    @IBOutlet weak var userNameImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    weak var delegate: AvatarViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBAction func tapOnAvatarView(_ sender: Any) {
        let myAvatarView = AvatarView()
        guard let userName = userNameLabel.text else { return }
        delegate?.view(view: myAvatarView, needPerform: AvatarView.Action.tapOnUserNameImage(name: userName))
    }
}
