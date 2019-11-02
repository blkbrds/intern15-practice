
import UIKit
protocol MyAvatarViewDelegate: class {
    func myAvatarView(_myAvatarView: MyAvatarView, didSelect index: Int)
}
class MyAvatarView: UIView {
    var userAvatar: UIImageView?
    var userName: UILabel?
    weak var delegate: MyAvatarViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)


        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        userAvatar = UIImageView(image: UIImage(named: "avatar.png"))
        userAvatar?.frame = frame
        userAvatar?.contentMode = .scaleToFill
        addSubview(userAvatar!)


        userName = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 50))
        userName?.text = "user name"
        userName?.backgroundColor = .lightGray
        userName?.textColor = .blue
        addSubview(userName!)

        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 250))
        button.backgroundColor
            = .clear
        button.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        addSubview(button)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func buttonDidClick() {
        print("button is click")
        delegate?.myAvatarView(_myAvatarView: self, didSelect: 10)
    }
}


