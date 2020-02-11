
import UIKit

class CollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var foodImageView: UIImageView!
	
	override func awakeFromNib() {
		super.awakeFromNib()

	}
	
	func updateUI(imageName: String) {
		if let image = UIImage(named: imageName) {
			foodImageView.image = image
		}
	}
}
