import UIKit

class MyView: UIView {

    @IBOutlet weak var photosButton: UIButton!
    @IBOutlet weak var friendButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!

    @IBOutlet weak var badgeFriendLabel: UILabel!
    @IBOutlet weak var badgeEmailLabel: UILabel!
    @IBOutlet weak var badgePhotoLabel: UILabel!
    
    var widthStyle: CGFloat = 40
    var heightStyle: CGFloat = 30
    var count = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    @IBAction func clickEmailButtonTouchUpInside(_ sender: Any) {
        widthStyle += 1
        heightStyle += 1
        count += 1
        badgeEmailLabel.isHidden = false
        badgeEmailLabel.text = "\(count)"
        badgeEmailLabel.frame = CGRect(x: badgeEmailLabel.frame.minX, y: badgeEmailLabel.frame.minY, width: widthStyle, height: heightStyle)
    }

    @IBAction func clickFriendButtonTouchUpInside(_ sender: UIButton) {
        widthStyle += 1
               heightStyle += 1
               count += 1
               badgeFriendLabel.isHidden = false
               badgeFriendLabel.text = "\(count)"
               badgeFriendLabel.frame = CGRect(x: badgeFriendLabel.frame.minX, y: badgeFriendLabel.frame.minY, width: widthStyle, height: heightStyle)
    }
    @IBAction func clickPhotosButtonTouchUpInside(_ sender: UIButton) {
        widthStyle += 1
        heightStyle += 1
        count += 1
        badgePhotoLabel.isHidden = false
        badgePhotoLabel.text = "\(count)"
        badgePhotoLabel.frame = CGRect(x: badgePhotoLabel.frame.minX, y: badgePhotoLabel.frame.minY, width: widthStyle, height: heightStyle)
    }
}

