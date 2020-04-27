import UIKit

class MyViewController: UIViewController {
    var xSpacing = 30
    var ySpacing = 50

    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect(x: 50, y: 50, width: 150, height: 200)
        let frame1 = CGRect(x: 50, y: 200, width: 150, height: 200)
        let frame2 = CGRect(x: 50, y: 350, width: 150, height: 200)
        let buttonView = Bundle.main.loadNibNamed("MyView", owner: self, options: nil)?[0] as? MyView
        guard let emailBadgeButton = buttonView else {
            return
        }
        emailBadgeButton.frame = frame
        emailBadgeButton.emailButton.layer.masksToBounds = false
        emailBadgeButton.emailButton.layer.cornerRadius = 25
        emailBadgeButton.emailButton.clipsToBounds = true
        emailBadgeButton.badgeEmailLabel.layer.masksToBounds = false
        emailBadgeButton.badgeEmailLabel.layer.cornerRadius = 5
        emailBadgeButton.badgeEmailLabel.clipsToBounds = true
        view.addSubview(emailBadgeButton)
        
        let buttonView1 = Bundle.main.loadNibNamed("MyView2", owner: self, options: nil)?[0] as? MyView
        guard let friendBadgeButton = buttonView1 else {
            return
        }
        friendBadgeButton.frame = frame1
        friendBadgeButton.friendButton.layer.masksToBounds = false
        friendBadgeButton.friendButton.layer.cornerRadius = 25
        friendBadgeButton.friendButton.clipsToBounds = true
        friendBadgeButton.badgeFriendLabel.layer.masksToBounds = false
        friendBadgeButton.badgeFriendLabel.layer.cornerRadius = 10
        friendBadgeButton.badgeFriendLabel.clipsToBounds = true
        view.addSubview(friendBadgeButton)
        
        let buttonView2 = Bundle.main.loadNibNamed("MyView3", owner: self, options: nil)?[0] as? MyView
        guard let photosBadgeButton = buttonView2 else {
            return
        }
        photosBadgeButton.frame = frame2
        photosBadgeButton.photosButton.layer.masksToBounds = false
        photosBadgeButton.photosButton.layer.cornerRadius = 25
        photosBadgeButton.photosButton.clipsToBounds = true
        photosBadgeButton.badgePhotoLabel.layer.masksToBounds = false
        photosBadgeButton.badgePhotoLabel.layer.cornerRadius = 18
        photosBadgeButton.badgePhotoLabel.clipsToBounds = true
        view.addSubview(photosBadgeButton)
    }

}
