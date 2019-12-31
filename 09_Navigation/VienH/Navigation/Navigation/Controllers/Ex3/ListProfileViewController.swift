import UIKit

final class ListProfileViewController: UIViewController {

    private let names: [String] = ["Hoang Vien", "Hanh Nguyen", "Thong MyLove", "Phuoc", "Tien Tran", "Bien", "Duy XT", "Tien Boss", "123123", "234234", "123411", "345567"]
    private let imagesName: [String] = ["download", "download", "download (3)", "download (4)", "download (5)", "download (6)",
        "download (7)", "download (8)", "images (1)", "images (2)", "images (3)", "images"]

    let spacing: CGFloat = 10
    var heightAvatarView = 160

    override func viewDidLoad() {
        super.viewDidLoad()

        var x = 0
        var y = 0
        for i in 0..<names.count {
            if i % 3 == 0 && i != 0 {
                x = 0
                y += 1
            }
            creatAvatarView(x: 20 + (((UIScreen.main.bounds.width - 40) - 2 * spacing) / 3 + spacing) * CGFloat(x), y: 70 + (160 + spacing) * CGFloat(y), image: imagesName[i], name: names[i])
            x += 1
        }
    }

    func creatAvatarView(x: CGFloat = 20, y: CGFloat = 70, image: String = "Defaultdownload.jpeg", name: String = "User name") {
        let width = ((UIScreen.main.bounds.width - 40) - 2 * spacing) / 3
        let height: CGFloat = 160
        let avatarView = UIView(frame: CGRect(x: x, y: y, width: width, height: height))
        avatarView.layer.borderWidth = 2
        avatarView.layer.borderColor = UIColor.black.cgColor
        view.addSubview(avatarView)

        let userAvatar = UIImageView()
        if let img = UIImage(named: image) {
            userAvatar.image = img
        } else {
            userAvatar.image = UIImage(named: "DefaultAvatar.png")
        }
        userAvatar.frame = CGRect(x: 0, y: 0, width: avatarView.bounds.width, height: avatarView.bounds.height * 0.8)
        userAvatar.contentMode = .scaleToFill
        userAvatar.isUserInteractionEnabled = true

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleBtn))
        tapGesture.name = "\(name),\(image)"
        userAvatar.addGestureRecognizer(tapGesture)
        avatarView.addSubview(userAvatar)

        let userName = UILabel(frame: CGRect(x: 0, y: userAvatar.bounds.height, width: avatarView.bounds.width, height: avatarView.bounds.height * 0.2))
        userName.text = name
        userName.numberOfLines = 0
        userName.font = UIFont.systemFont(ofSize: 12)
        userName.textAlignment = .center
        userName.backgroundColor = .lightGray
        userName.textColor = .blue
        avatarView.addSubview(userName)
    }

    @objc private func handleBtn(_ sender: UITapGestureRecognizer) {
        guard let string = sender.name else { return }

        let s = string.split(separator: ",")
        let vc = ProfileViewController()
        vc.name = String(describing: s[0])
        vc.image = String(describing: s[1])
        navigationController?.pushViewController(vc, animated: true)
    }
}


