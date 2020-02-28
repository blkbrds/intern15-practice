import UIKit

final class CoffeeCollectionView: UICollectionView {
	
	var coffeeCollectionViewCell : String = "CoffeeCollectionViewCell"
	
	override func awakeFromNib() {
	super.awakeFromNib()
		setupUI()
	}
}

extension CoffeeCollectionView : UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: self.bounds.width, height: self.bounds.height)
	}
}

extension UICollectionView {

	func loadNibString(str: String = "Cell") {
		let nib = UINib(nibName: str, bundle: .main)
		self.register(nib, forCellWithReuseIdentifier: str)
	}
	
	func setupUI() {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		self.collectionViewLayout = layout
		self.isPagingEnabled = true				
	}
}
