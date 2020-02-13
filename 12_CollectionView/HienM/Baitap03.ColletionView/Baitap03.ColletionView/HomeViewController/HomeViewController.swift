import UIKit

class HomeViewController: UIViewController {
	var flowers: [String] = ["flower-1", "flower-2", "flower-3", "flower-4", "flower-5", "flower-6", "flower-7"]
	var sections: [String] = ["Loại 1", "Loại 2", "Loại 3", "Loại 4", "Loại 5", "Loại 6", "Loại 7"]

	private let keyCell: String = "HomeCell"
	private let keyHeaderCell: String = "myHeader"

	@IBOutlet weak var homeCollectionView: UICollectionView!

	override func viewDidLoad() {
		super.viewDidLoad()
		loadNib()
		loadHeader()
	}

	func loadNib() {
		let nib = UINib(nibName: keyCell, bundle: .main)
		homeCollectionView.register(nib, forCellWithReuseIdentifier: keyCell)
		homeCollectionView.backgroundColor = #colorLiteral(red: 0.7776146531, green: 0.9668715596, blue: 0.922586143, alpha: 1)
	}

	func loadHeader() {
		let headerNib = UINib(nibName: "HeaderView", bundle: .main)
		homeCollectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: keyHeaderCell)
		let layout = UICollectionViewFlowLayout()

		layout.headerReferenceSize = CGSize(width: 0, height: 40)
		homeCollectionView.collectionViewLayout = layout
	}
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return sections.count
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return flowers.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: keyCell, for: indexPath) as! HomeCell
		cell.flowerImage.image = UIImage(named: flowers[indexPath.row])
		cell.backgroundColor = #colorLiteral(red: 0.7776146531, green: 0.9668715596, blue: 0.922586143, alpha: 1)
		return cell
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		return CGSize(width: collectionView.frame.width, height: 50)
	}

	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

		switch kind {
		case UICollectionView.elementKindSectionHeader:
			let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: keyHeaderCell, for: indexPath) as! HeaderView
			reusableview.nameHeaderLabel.text = sections[indexPath.section]
			reusableview.numberHeaderLabel.text = "\(flowers.count)"

			return reusableview
		default:
			fatalError("Unexpected element kind")
		}
	}
}

