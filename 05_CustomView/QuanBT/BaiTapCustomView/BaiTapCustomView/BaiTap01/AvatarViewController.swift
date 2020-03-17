import UIKit

class AvatarViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var scrollView: UIScrollView!
    
    // MARK: - Declare Variable
    private let usenames: [String] = ["Name 1", "Name 2", "Name 3", "Name 4", "Name 5", "Name 6", "Name 7", "Name 8", "Name 9", "Name 10", "Name 11", "Name 12", "Name 13", "Name 14", "Name 15", "Name 16", "Name 17", "Name 18", "Name 19", "Name 20", "Name 21", "Name 22", "Name 23", "Name 24", "Name 25", "Name 26", "Name 27", "Name 27", "Name 29", "Name 30"]
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

extension AvatarViewController: MyAvatarDelegate {
    func nameAvatar(name avatar: String ) {
        print(avatar)
    }
}
