import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    var coordinatesX: CGFloat = 10
    var coordinatesY: CGFloat = 10
    var names: [String] = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HOME"
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.loadAvatar()
        }
    }
    
    func loadAvatar() {
        for index in 1...30 {
            scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 2)
            let avatar = Bundle.main.loadNibNamed("AvatarView", owner: self, options: nil)?.first as? AvatarView
            if let avatar = avatar {
                avatar.frame = CGRect(x: coordinatesX, y: coordinatesY, width: (UIScreen.main.bounds.width - CGFloat(40)) / 3, height: (UIScreen.main.bounds.width - CGFloat(40)) / 3)
                avatar.userName = names[index - 1]
                avatar.delegate = self
                avatar.tag = index
                coordinatesX += (UIScreen.main.bounds.width - CGFloat(40)) / 3 + 10
                if index % 3 == 0 {
                    coordinatesY += (UIScreen.main.bounds.width - CGFloat(40)) / 3 + 10
                    coordinatesX = 10
                }
                avatar.updateName()
                scrollView.addSubview(avatar)
            }
        }
    }
}

extension HomeViewController: AvatarViewDelegate {
    func tap(userName: String, imageView: String, index: Int) {
        let vc = ProfileViewController()
        vc.userName = userName
        vc.imageView = imageView
        vc.index = index
        vc.delegate = self
        if let navigationController = navigationController {
            navigationController.pushViewController(vc, animated: true)
        }
    }
}

extension HomeViewController: ProfileViewControllerDelegate {
    func updateData(userName: String, index: Int) {
        guard index > 0 && index <= names.count else {
            return
        }
        names[index - 1] = userName
        for subView in scrollView.subviews {
            if let avatar = subView as? AvatarView, avatar.tag == index {
                avatar.userName = names[index - 1]
                avatar.updateName()
            }
        }
    }
}


