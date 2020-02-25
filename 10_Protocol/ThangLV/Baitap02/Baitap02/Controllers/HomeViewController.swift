import UIKit

struct Avatar {
    let userImageName: String
    var userName: String
}

class HomeViewController: UIViewController {

    @IBOutlet private weak var scrollView: UIScrollView!

    var userAvatars: [Avatar] = [Avatar(userImageName: "Deer", userName: "Deer 1"),
                                 Avatar(userImageName: "Dog", userName: "Dog 1"),
                                 Avatar(userImageName: "Elephant", userName: "Elephant 1"),
                                 Avatar(userImageName: "Fox", userName: "Fox 1"),
                                 Avatar(userImageName: "Gibbon", userName: "Gibbon 1"),
                                 Avatar(userImageName: "Horse", userName: "Horse 1"),
                                 Avatar(userImageName: "Parrot", userName: "Parrot 1"),
                                 Avatar(userImageName: "Sheep", userName: "Sheep 1"),
                                 Avatar(userImageName: "Squirrel", userName: "Squirrel 1"),
                                 Avatar(userImageName: "Tiger", userName: "Tiger 1"),
                                 Avatar(userImageName: "Deer", userName: "Deer 2"),
                                 Avatar(userImageName: "Dog", userName: "Dog 2"),
                                 Avatar(userImageName: "Elephant", userName: "Elephant 2"),
                                 Avatar(userImageName: "Fox", userName: "Fox 2"),
                                 Avatar(userImageName: "Gibbon", userName: "Gibbon 2"),
                                 Avatar(userImageName: "Horse", userName: "Horse 2"),
                                 Avatar(userImageName: "Parrot", userName: "Parrot 2"),
                                 Avatar(userImageName: "Sheep", userName: "Sheep 2"),
                                 Avatar(userImageName: "Squirrel", userName: "Squirrel 2"),
                                 Avatar(userImageName: "Tiger", userName: "Tiger 2"),
                                 Avatar(userImageName: "Deer", userName: "Deer 3"),
                                 Avatar(userImageName: "Dog", userName: "Dog 3"),
                                 Avatar(userImageName: "Elephant", userName: "Elephant 3"),
                                 Avatar(userImageName: "Fox", userName: "Fox 3"),
                                 Avatar(userImageName: "Gibbon", userName: "Gibbon 3"),
                                 Avatar(userImageName: "Horse", userName: "Horse 3"),
                                 Avatar(userImageName: "Parrot", userName: "Parrot 3"),
                                 Avatar(userImageName: "Sheep", userName: "Sheep 3"),
                                 Avatar(userImageName: "Squirrel", userName: "Squirrel 3"),
                                 Avatar(userImageName: "Tiger", userName: "Tiger 3"),
                                 Avatar(userImageName: "Deer", userName: "Deer 4"),
                                 Avatar(userImageName: "Dog", userName: "Dog 4"),
                                 Avatar(userImageName: "Elephant", userName: "Elephant 4")]
    var myAvatarView: AvatarView?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupUI()
    }

    private func setupUI() {
        title = "Home"
        var x: Int = 4
        var y: Int = 50
        var index: Int = 0
        for i in 1...33 {
            myAvatarView = Bundle.main.loadNibNamed("AvatarView", owner: self, options: nil)?[0] as? AvatarView
            guard let myAvatarView = myAvatarView else { return }
            myAvatarView.frame = CGRect(x: x, y: y, width: 130, height: 150)
            myAvatarView.userImageView.contentMode = .scaleToFill
            myAvatarView.delegate = self
            myAvatarView.tag = index
            myAvatarView.userNameLabel.text = userAvatars[index].userName
            myAvatarView.userImageView.image = UIImage(named: userAvatars[index].userImageName)

            scrollView.addSubview(myAvatarView)
            x += 130 + 8
            if i % 3 == 0 {
                x = 4
                y += 158
            }
            index += 1
        }
        scrollView.contentSize = CGSize(width: scrollView.bounds.width, height: 1800)
    }
}

extension HomeViewController: AvatarViewDelegate {
    func view(view: AvatarView, needPerform action: AvatarView.Action) {
        switch action {
        case .tapOnUserNameImage(let name, let imageView):
            let profileViewController = ProfileViewController()
            profileViewController.name = name
            profileViewController.image = imageView.image
            profileViewController.delegate = self
            profileViewController.view.tag = view.tag
            navigationController?.pushViewController(profileViewController, animated: true)
        }
    }
}

extension HomeViewController: ProFileViewControllerDelegate {
    func viewController(viewController: ProfileViewController, needPerform action: ProfileViewController.Action) {
        switch action {
        case .changeDataToHomePage(let updatedUserName):
            let sender: Int = viewController.view.tag
            userAvatars[sender].userName = updatedUserName
        }
    }
}
