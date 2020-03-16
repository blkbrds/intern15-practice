import UIKit

final class AvatarViewController: UIViewController {
    var usernames = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    var images = ["avatar.jpg","avatar.jpg","avatar.jpg","avatar.jpg","avatar.jpg",
                    "avatar.jpg","avatar.jpg","avatar.jpg","avatar.jpg"]
    @IBOutlet var usernameLabels: [UILabel]!
    @IBOutlet var imageViews: [UIImageView]!
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 0 ..< usernameLabels.count {
            usernameLabels[index].text = "Name \(usernames[index])"
        }
        
        for i in 0 ..< imageViews.count {
            imageViews[i].image = UIImage(named:images[i])
            imageViews[i].contentMode = .scaleToFill
        }
    }
  
    @IBAction func printName1(_ sender: UIButton) {
        for index in 0 ..< buttons.count {
            if sender == buttons[index] {
                print("Name \(usernames[index])")
            }
        }
    }
}
