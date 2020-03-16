import UIKit

class AvatarViewController: UIViewController {

    var xSpacing = 20
    var ySpaceing = 30
    var names = ["Jack", "SISO", "TIDE", "OBAMA", "OMO", "SIRO", "TURTEL", "JEANNE", "JESSI"]

    override func viewDidLoad() {
        super.viewDidLoad()
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        let myScrollView = UIScrollView(frame: CGRect(x: 10, y: 10, width: screenWidth, height: screenHeight))
        view.addSubview(myScrollView)
        for i in 1..<names.count + 1 {
            let frame = CGRect(x: xSpacing, y: ySpaceing, width: 100, height: 200)
            let avatarView = AvatarView(frame: frame)
            avatarView.delegate = self
            avatarView.userNameLabel?.text = names[i - 1]
            xSpacing += 110
            if i % 3 == 0 {
                xSpacing = 20
                ySpaceing += 200
            }
            myScrollView.addSubview(avatarView)
        }
    }
}

extension AvatarViewController: MyAvatarDelegate {
    func avatarView(_ myAvatar: AvatarView, didSelect index: Int) {
        <#code#>
    }
}
