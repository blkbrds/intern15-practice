import UIKit

class HomeViewController: UIViewController {
//    weak var delegate: HomeViewControllerDelate?
    
    @IBOutlet weak var bigScrollViewUI: UIScrollView!
    var xSpace: CGFloat = 10
    var ySpace: CGFloat = 20
    let widthView: CGFloat = 100
    let heightView: CGFloat = 150

    var nameAvatar: [String] = ["Obama","Donaln Trump","Putin","Mical JackSon","Messi","Ronadinho","Bee","Jeanne","Arthur","Atila","Demon","Evil","Ho Cam Dao","Smile","XXA","ScopField","Police","Enmy","CoTo","Phonexi","Zidane"]
    
    var saveImage: [String] = ["obama","trump","putin","jao","jao","jao","jao","jao","jao","jao","jao","jao","jao","jao","jao","jao","jao","jao","jao","jao","jao",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        bigScrollViewUI.contentSize = CGSize(width: view.bounds.width, height: 2000)
        view.addSubview(bigScrollViewUI)
        setUp()
    }
    
    func setUp(){
        for i in 1...21 {
            let createAvatarView = Bundle.main.loadNibNamed("avatarView", owner: self, options: nil)? [0] as? AvatarView
            createAvatarView?.frame = CGRect(x: xSpace, y: ySpace, width: widthView, height: heightView)
            createAvatarView?.nameAvatarLabel.text = nameAvatar[i-1]
            createAvatarView?.avatarImageView.image = UIImage(named: saveImage[i-1])
            createAvatarView?.detailsButton.tag = i - 1
            bigScrollViewUI.addSubview(createAvatarView!)
            xSpace += 120
            if i % 3 == 0 {
                ySpace +=  300
                xSpace = 10
            }
            createAvatarView!.delegate = self

        }
    }

}
extension HomeViewController: AvatarViewDelegate {
    func avatarView(viewController: UIViewController, value: String, buttonTag: Int) {
        let editVC = EditViewController()
        navigationController?.pushViewController(editVC, animated: true)
        editVC.name = value
        editVC.nameImage = saveImage[buttonTag]
    }
}
