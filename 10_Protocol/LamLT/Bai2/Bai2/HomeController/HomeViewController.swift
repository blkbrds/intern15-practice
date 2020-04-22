import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet private weak var scrollView: UIScrollView!
    var xSpace: CGFloat = 10
    var ySpace: CGFloat = 20
    let widthView: CGFloat = 100
    let heightView: CGFloat = 150

    var imageNames: [String] = ["Obama", "Donaln Trump", "Putin", "Mical JackSon", "Messi", "Ronadinho", "Bee", "Jeanne", "Arthur", "Atila", "Demon", "Evil", "Ho Cam Dao", "Smile", "XXA", "ScopField", "Police", "Enmy", "CoTo", "Phonexi", "Zidane"]

    var saveImage: [String] = ["obama", "trump", "putin", "jao", "jao", "jao", "jao", "jao", "jao", "jao", "jao", "jao", "jao", "jao", "jao", "jao", "jao", "jao", "jao", "jao", "jao",]

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
            createAvatarView1.avatarNameLabel.text = imageNames[i - 1]
            createAvatarView1.avatarImageView.image = UIImage(named: saveImage[i - 1])
            createAvatarView1.avatarDetailButoon.tag = i - 1
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
        editVC.nameImage = saveImage[buttonTag]
    }
}

extension HomeViewController: EditAvatarDelegate {
    func controller(controller: EditViewController, needPerformAction action: EditViewController.Action) {
        switch action {
        case .updateUI(let nameImage):

            let index = controller.view.tag
            let viewAvatar = avatarViews[index]

            viewAvatar.avatarNameLabel.text = nameImage

        }
    }
}


