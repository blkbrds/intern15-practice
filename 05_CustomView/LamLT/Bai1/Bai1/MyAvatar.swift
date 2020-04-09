import UIKit
protocol MyAvatarDelegate: class {
    func avatarView(_ myAvatar: AvatarView, didSelect index: Int)
}
class AvatarView: UIView {

    weak var delegate: MyAvatarDelegate?

    var count: Int = 0
    var userAvatarImageView: UIImageView!
    var userNameLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)

        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        userAvatarImageView = UIImageView(image: UIImage(named: "uss"))
        userAvatarImageView.frame = frame
        userAvatarImageView.contentMode = .scaleToFill
        addSubview(userAvatarImageView)

        let frame1 = CGRect(x: 0, y: 100, width: 100, height: 50)
        userNameLabel = UILabel(frame: frame1)
        userNameLabel.text = "User Name"
        userNameLabel.backgroundColor = .lightGray
        userNameLabel.textAlignment = .center
        userNameLabel.textColor = .blue
        addSubview(userNameLabel)

        let frame2 = CGRect(x: 50, y: 100, width: 100, height: 250)
        let buttonUser = UIButton(frame: frame2)
        buttonUser.backgroundColor = .clear
        buttonUser.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        addSubview(buttonUser)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func buttonDidClick() {
        count += 1
        userNameLabel?.text = "\(count)"
        delegate?.avatarView(self, didSelect: 10)
    }
}
