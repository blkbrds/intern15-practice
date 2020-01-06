import UIKit

protocol AvatarViewDelegate: class {
    func tapOnUserNameImage(name: String)
}

class AvatarView: UIView {
    
    @IBOutlet var userNameImageView: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    
    var delegate: AvatarViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    @IBAction func tapOnAvatarView(_ sender: Any) {
        delegate?.tapOnUserNameImage(name: userNameLabel.text!)
    }
    
}
