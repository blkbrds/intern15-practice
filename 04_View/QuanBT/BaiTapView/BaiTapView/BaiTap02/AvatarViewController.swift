import UIKit

final class AvatarViewController: UIViewController {
    var arrUsers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    var arrImage = ["avatar.jpg","avatar.jpg","avatar.jpg","avatar.jpg","avatar.jpg",
                    "avatar.jpg","avatar.jpg","avatar.jpg","avatar.jpg"]
    @IBOutlet var labelNames: [UILabel]!
    @IBOutlet var imageUsers: [UIImageView]!
    @IBOutlet var buttonName: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 0 ..< labelNames.count {
            labelNames[index].text = "Name \(arrUsers[index])"
        }
        
        for i in 0 ..< imageUsers.count {
            imageUsers[i].image = UIImage(named:arrImage[i])
            imageUsers[i].contentMode = .scaleToFill
        }
    }
  
    @IBAction func printName1(_ sender: UIButton) {
        for index in 0 ..< buttonName.count {
            if sender == buttonName[index] {
                print("Name \(arrUsers[index])")
            }
        }
    }
}
