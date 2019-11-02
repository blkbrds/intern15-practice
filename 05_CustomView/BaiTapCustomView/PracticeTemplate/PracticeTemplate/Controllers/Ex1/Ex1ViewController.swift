
import UIKit
struct Person {
    var name: String
    var avatar: String

    init(name: String, avatar: String) {
        self.name = name
        self.avatar = avatar
    }
}
class Ex1ViewController: BaseViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    var exercise: Exercise?

    var user: [Person] =
        [Person(name: "Hanh", avatar: "avatar.png"),
            Person(name: "Hanh", avatar: "avatar.png"),
            Person(name: "Hanh", avatar: "avatar.png"),
            Person(name: "Hanh", avatar: "avatar.png"),
            Person(name: "Hanh", avatar: "avatar.png"),
            Person(name: "Hanh", avatar: "avatar.png"),
            Person(name: "Hanh", avatar: "avatar.png"),
            Person(name: "Hanh", avatar: "avatar.png"),
            Person(name: "Hanh", avatar: "avatar.png"),
            Person(name: "Hanh", avatar: "avatar.png"),
            Person(name: "Hanh", avatar: "avatar.png"),
            Person(name: "Hanh", avatar: "avatar.png"),
            Person(name: "Hanh", avatar: "avatar.png"),
            Person(name: "Hanh", avatar: "avatar.png"),
            Person(name: "Hanh", avatar: "avatar.png"),
            Person(name: "Hanh", avatar: "avatar.png"),
            Person(name: "Hanh", avatar: "avatar.png"),
            Person(name: "Hanh", avatar: "avatar.png"),
            Person(name: "Hanh", avatar: "avatar.png"),
            Person(name: "Hanh", avatar: "avatar.png"),
            Person(name: "Hanh", avatar: "avatar.png"),
            Person(name: "Hanh", avatar: "avatar.png"),
            Person(name: "Hanh", avatar: "avatar.png"),
            Person(name: "Hanh", avatar: "avatar.png")

        ]
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 2000)
        show()
    }
    func addProfileView(frame: CGRect, user: Person) -> UIView {
        let contaier = UIView(frame: frame)
        let userAvatar = UIImageView(image: UIImage(named: user.avatar))
        userAvatar.frame = CGRect(x: 0, y: 0, width: 120, height: 130)
        contaier.backgroundColor = .red
        contaier.addSubview(userAvatar)

        let userName = UILabel(frame: CGRect(x: 0, y: 130, width: 120, height: 30))
        userName.text = user.name
        userName.backgroundColor = UIColor(red: 0.0, green: 0.7, blue: 1.3, alpha: 1.0)
        userName.textColor = .white
        contaier.addSubview(userName)

        return contaier
    }
    func show() {
        var x: CGFloat = 12
        var y: CGFloat = 40
        for i in 0..<user.count {
            let frame = CGRect(x: x, y: y, width: 120, height: 130)
            let container = addProfileView(frame: frame, user: user[i])
            scrollView.addSubview(container)
            x += 135
            if x >= UIScreen.main.bounds.width {
                x = 10
                y += 160 + 10
            }
        }

    }
}

extension Ex1ViewController: MyAvatarViewDelegate {
    func myAvatarView(_myAvatarView: MyAvatarView, didSelect index: Int) {
        print("Slect user view index \(index).")
    }
}

