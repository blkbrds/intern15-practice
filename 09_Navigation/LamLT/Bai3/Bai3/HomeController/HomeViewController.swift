import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var bigScrollViewUI: UIScrollView!
    
    var xSpace: CGFloat = 10
    var ySpace: CGFloat = 20
    let widthView: CGFloat = 100
    let heightView: CGFloat = 150
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp(){
        for i in 1...21 {
            let createAvatarView = Bundle.main.loadNibNamed("avatarView", owner: self, options: nil)? [0] as? AvatarView
            createAvatarView?.frame = CGRect(x: xSpace, y: ySpace, width: widthView, height: heightView)
            createAvatarView?.avatarImage.image = UIImage(named: "jao")
//            view.addSubview(createAvatarView!)
            bigScrollViewUI.addSubview(createAvatarView!)
            xSpace += 120
            if i % 3 == 0 {
                ySpace +=  300
                xSpace = 10
            }
        }
    }
}
