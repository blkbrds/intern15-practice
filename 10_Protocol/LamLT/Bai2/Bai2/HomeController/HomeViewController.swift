import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet private weak var scrollView: UIScrollView!
    var xSpace: CGFloat = 10
    var ySpace: CGFloat = 20
    let widthView: CGFloat = 100
    let heightView: CGFloat = 150

    var avatarNames: [String] = ["Obama", "Donaln Trump", "Putin", "Mical JackSon", "Messi", "Ronadinho", "Bee", "Jeanne", "Arthur", "Atila", "Demon", "Evil", "Ho Cam Dao", "Smile", "XXA", "ScopField", "Police", "Enmy", "CoTo", "Phonexi", "Zidane"]

    var savedImageNames: [String] = ["obama", "trump", "putin", "jao", "jao", "jao", "jao", "jao", "jao", "jao", "jao", "jao", "jao", "jao", "jao", "jao", "jao", "jao", "jao", "jao", "jao",]

    var avatarViews = [AvatarView]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 2000)
        view.addSubview(scrollView)
        setUpUI()
    }

    func setUpUI() {
        for i in 1...21 {
            let createAvatarView = Bundle.main.loadNibNamed("AvatarView", owner: self, options: nil)?[0] as? AvatarView
            guard let createAvatarView1 = createAvatarView else {
                return
            }
            createAvatarView1.frame = CGRect(x: xSpace, y: ySpace, width: widthView, height: heightView)
            createAvatarView1.setAvatarName(avatarName: avatarNames[i - 1])
            guard let avatarImage = UIImage(named: savedImageNames[i - 1]) else { return }
            createAvatarView1.setAvatarImage(avatarImage: avatarImage)
            createAvatarView1.setAvatarDetailButtonTag(avatarTag: i - 1)
            scrollView.addSubview(createAvatarView1)
            xSpace += 120
            if i % 3 == 0 {
                ySpace += 300
                xSpace = 10
            }
            createAvatarView1.delegate = self
        }
    }
}

extension HomeViewController: AvatarViewDelegate {
    func view(view: AvatarView, value: String, buttonTag: Int) {
        let editVC = EditViewController()
        navigationController?.pushViewController(editVC, animated: true)
        editVC.nameLabelAvatar = value
        editVC.nameImage = savedImageNames[buttonTag]
    }
}

extension HomeViewController: EditAvatarDelegate {
    func controller(controller: EditViewController, needPerformAction action: EditViewController.Action) {
        switch action {
        case .updateUI(let nameImage):

            let index = controller.view.tag
            let viewAvatar = avatarViews[index]

            viewAvatar.setAvatarName(avatarName: nameImage ?? "")

        }
    }
}


