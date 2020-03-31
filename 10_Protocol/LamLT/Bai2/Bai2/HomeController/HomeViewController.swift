import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var bigScrollViewUI: UIScrollView!
    var xSpace: CGFloat = 10
    var ySpace: CGFloat = 20
    let widthView: CGFloat = 100
    let heightView: CGFloat = 150

    var dataAvatar = DataAvatar()



    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        bigScrollViewUI.contentSize = CGSize(width: view.bounds.width, height: 2000)
        view.addSubview(bigScrollViewUI)
        setUp()
    }

    func setUp() {
        for i in 1...21 {
            let createAvatarView = Bundle.main.loadNibNamed("AvatarView", owner: self, options: nil)? [0] as? AvatarView
            createAvatarView?.frame = CGRect(x: xSpace, y: ySpace, width: widthView, height: heightView)
            createAvatarView?.avatarNameLabel.text = dataAvatar.nameAvatar[i - 1]
            createAvatarView?.avatarImageView.image = UIImage(named: dataAvatar.saveImage[i - 1])
            createAvatarView?.avatarDetailButoon.tag = i - 1
            bigScrollViewUI.addSubview(createAvatarView!)
            xSpace += 120
            if i % 3 == 0 {
                ySpace += 300
                xSpace = 10
            }
            createAvatarView!.delegate = self as? AvatarViewDelegate
        }
    }
}


extension HomeViewController: AvatarViewDelegate {
    func avatarView(viewController: UIViewController, value: String, buttonTag: Int) {
        let editVC = EditViewController()
        navigationController?.pushViewController(editVC, animated: true)
        editVC.nameLabelAvatar = value
        editVC.nameImage = dataAvatar.saveImage[buttonTag]
    }
}
