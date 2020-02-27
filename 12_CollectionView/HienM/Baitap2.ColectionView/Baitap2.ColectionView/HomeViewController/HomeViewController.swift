import UIKit

final class HomeViewController: UIViewController {
	@IBOutlet weak private var myCollectionView: UICollectionView!

	private let images = ["pasta0", "pasta1", "pasta2", "pasta3", "pasta4", "pasta5", "pasta6",
		"pizza0", "pizza1", "pizza2", "pizza3", "pizza4", "pizza5", "pizza6", "pizza1", "pizza2", "pizza3", "pizza4", "pizza5", "pizza6"
	]
	private let collectionViewCell: String = "CollectionViewCell"

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Colletion View"
		setupUI()
	}

	private func setupUI() {
		loadNib()
		let layout = PinterestLayout()
		myCollectionView.collectionViewLayout = layout
		layout.delegate = self
	}

	private func loadNib() {
		let nib = UINib(nibName: collectionViewCell, bundle: .main)
		myCollectionView.register(nib, forCellWithReuseIdentifier: collectionViewCell)
	}
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return images.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCell, for: indexPath) as! CollectionViewCell
		return cell
	}
}

extension HomeViewController: PinterestLayoutDelegate {
	func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
		guard let image = UIImage(named: self.images[indexPath.row]) else {
			return 0
		}
		return image.size.height
	}
}
