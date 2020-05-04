import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    private var coordinatesX: CGFloat = 10
    private var coordinatesY: CGFloat = 10
    
    var userNameArray: [String] = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21"]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HOME"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        for i in 1...21 {
            scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 1.5)
            let avatar = Bundle.main.loadNibNamed("AvatarView", owner: self, options: nil)?.first as? AvatarView
            avatar?.frame = CGRect(x: coordinatesX, y: coordinatesY, width: (UIScreen.main.bounds.width - CGFloat(40)) / 3, height: (UIScreen.main.bounds.width - CGFloat(40)) / 3)
            if let avatar = avatar {
                coordinatesX += (avatar.frame.width) + 10
                avatar.userName = userNameArray[i-1]
                avatar.delegate = self
                if i % 3 == 0 {
                    coordinatesY += (UIScreen.main.bounds.width - CGFloat(40)) / 3
                    coordinatesX = 10
                }
                avatar.updateView()
                scrollView.addSubview(avatar)
            }
        }
    }
}

extension HomeViewController: AvatarViewDelegate {
    func tap(userName: String, nameImageView: String) {
        let vc = ProfileViewController()
        vc.userName = userName
        vc.imageName = nameImageView
        navigationController?.pushViewController(vc, animated: true)
    }
}
