import UIKit

class HeroCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameHeroLabel: UILabel!
    @IBOutlet weak var heroImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        heroImageView.layer.cornerRadius = 10
        heroImageView.clipsToBounds = true
        nameHeroLabel.layer.cornerRadius = 10
        nameHeroLabel.clipsToBounds = true
    }
    
    func updateCell(avatar: UIImage, name: String) {
        heroImageView.image = avatar
        nameHeroLabel.text = name
    }
}
