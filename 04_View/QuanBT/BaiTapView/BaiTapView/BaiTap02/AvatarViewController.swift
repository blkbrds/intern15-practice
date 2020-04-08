import UIKit

final class AvatarViewController: UIViewController {
    private var usernames = Array(1...9)
    private var images = Array(repeating: "avatar.jpg", count: 9)
    @IBOutlet private var usernameLabels: [UILabel]!
    @IBOutlet private var imageViews: [UIImageView]!
    @IBOutlet private var nameButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        for index in 0 ..< usernameLabels.count {
            usernameLabels[index].text = "Name \(usernames[index])"
        }
        
        for i in 0 ..< imageViews.count {
            imageViews[i].image = UIImage(named:images[i])
            imageViews[i].contentMode = .scaleToFill
        }
    }
    
    @IBAction private func printUsername(_ sender: UIButton) {
        for index in 0 ..< nameButtons.count {
            if sender == nameButtons[index] {
                print("Name \(usernames[index])")
            }
        }
    }
}
