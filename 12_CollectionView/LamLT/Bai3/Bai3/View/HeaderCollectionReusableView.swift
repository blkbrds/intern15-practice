import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var attributesAvatarImageView: UIImageView!
    @IBOutlet weak var attributesNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        attributesAvatarImageView.layer.cornerRadius = 30
        attributesAvatarImageView.clipsToBounds = true
    }
    
    func updateHeader(avatar: UIImage, name: String) {
        attributesAvatarImageView.image = avatar
        attributesNameLabel.text = name
    }
}
