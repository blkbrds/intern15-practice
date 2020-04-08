import UIKit

class AvatarViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var scrollView: UIScrollView!
    
    // MARK: - Declare Variable
    private let usenames: [Int] = Array(1...30)
    private let images: [String] = Array(repeating: "avatar", count: 30)
    
    //MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Private function
    private func setupView() {
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height)
        var xUserView: CGFloat = 10
        var yUserView: CGFloat = 0
        let widthUserView: CGFloat = 100
        let heightUserView: CGFloat = 130
        let widthScreen = scrollView.bounds.width
        let space: CGFloat = 10
        
        for index in 0 ..< usenames.count {
            let frame = CGRect(x: xUserView, y: yUserView, width: widthUserView, height: heightUserView)
            let avatar = MyAvatar(frame: frame)
            
            avatar.updateUI(imageAvatar: images[index], getUsername: usenames[index])
            avatar.delegate = self
            scrollView.addSubview(avatar)
            
            if xUserView + widthUserView > widthScreen - xUserView {
                xUserView = space
                yUserView += heightUserView + space
            } else {
                xUserView += widthUserView + space
            }
        }
    }
}

// MARK: - Extension
extension AvatarViewController: MyAvatarDelegate {
    func printNameAvatar(name avatar: String ) {
        print(avatar)
    }
}
