import UIKit

protocol AvatarViewDelegate: class {
    func view(view: AvatarView, value: String, buttonTag: Int)
}
class AvatarView: UIView {

    weak var delegate: AvatarViewDelegate?
    
    @IBOutlet weak var avatarDetailButoon: UIButton!
    @IBOutlet weak var avatarNameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!

    override func awakeFromNib() {
        avatarImageView.image = UIImage(named: "jao")
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    @IBAction private func avatarButtonTouchUpInside(_ sender: Any) {
        if let delegate = delegate, let name = self.avatarNameLabel.text {
            delegate.view(view: self, value: name, buttonTag: avatarDetailButoon.tag)
        }
    } }
