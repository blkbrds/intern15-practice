import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    let userNames: [String] = ["User 1", "User 2", "User 3", "User 4", "User 5", "User 6", "User 7", "User 8", "User 9", "User 10", "User 11", "User 12", "User 13", "User 14", "User 15", "User 16", "User 17", "User 18", "User 19", "User 20", "User 21", "User 22", "User 23", "User 24", "User 25", "User 26", "User 27", "User 28", "User 29", "User 30", "User 31", "User 32", "User 33"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Home"
        setUpUI()
    }
    
    private func setUpUI() {
        var x: Int = 4
        var y: Int = 50
        var index: Int = 0
        for i in 1...33 {
            let myAvatarView = Bundle.main.loadNibNamed("AvatarView", owner: self, options: nil)![0] as! AvatarView
            myAvatarView.frame = CGRect(x: x, y: y, width: 130, height: 150)
            myAvatarView.userNameImageView.contentMode = .scaleToFill
            myAvatarView.delegate = self as AvatarViewDelegate
            myAvatarView.userNameLabel.text = userNames[index]
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
    func tapOnUserNameImage(name: String) {
        let profileViewController = ProfileViewController()
        profileViewController.name = name
        navigationController?.pushViewController(profileViewController, animated: true)
    }
}
