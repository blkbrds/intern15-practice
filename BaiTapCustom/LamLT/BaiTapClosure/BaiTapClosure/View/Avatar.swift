import UIKit

class Avatar: UIView {

    let userAvatar = UIImageView(image: UIImage(named: "cat"))

    enum TypeView {
        case on
//        case off
    }

    var action: ((TypeView) -> Void)?

//    var type: TypeView = .on

//    init(type: TypeView = .on) {
//        super.init(frame: CGRect.zero)
//        self.type = type
//        layer.borderWidth = 1.0
//        layer.masksToBounds = false
//        layer.cornerRadius = layer.frame.size.height / 2
//        clipsToBounds = true
//
//        let userAvatar = UIImageView(image: UIImage(named: "cat"))
//        userAvatar.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
//        self.addSubview(userAvatar)
//    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        layer.borderWidth = 1.0
        layer.masksToBounds = false
//        layer.cornerRadius = layer.frame.size.height / 2
        clipsToBounds = true

        userAvatar.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        userAvatar.contentMode = .scaleAspectFit
        self.addSubview(userAvatar)
        // add user avatar

        updatePicture()
    }

    private func updatePicture() {
        self.action?(.on)

    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override class func awakeFromNib() {
        super.awakeFromNib()
    }

}
