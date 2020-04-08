import UIKit

class SubCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func updateCell(avatar: UIImage) {
        imageView.image = avatar
    }
}
