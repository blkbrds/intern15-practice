import UIKit

final class SecondTableViewCell: UITableViewCell {

	private var indexCell = 0
	private let marvel: [String] = ["mavel 1", "mavel 2", "mavel 3", "mavel 4", "mavel 5", "mavel 6", "mavel 1", "mavel 2", "mavel 3", "mavel 4", "mavel 5", "mavel 6", "mavel 1", "mavel 2", "mavel 3", "mavel 4", "mavel 5", "mavel 6", "mavel 1", "mavel 2", "mavel 3", "mavel 4", "mavel 5", "mavel 6", "mavel 1", "mavel 2", "mavel 3", "mavel 4", "mavel 5", "mavel 6", "mavel 1", "mavel 2", "mavel 3", "mavel 4", "mavel 5", "mavel 6",]
	private let nameCell: String = "firstCell"

	@IBOutlet weak private var sliderCollectionView: UICollectionView!

	override func awakeFromNib() {
		super.awakeFromNib()
		setupIU()
	}

	private func setupIU () {
		let layout = UICollectionViewFlowLayout()
		layout.minimumInteritemSpacing = 10
		layout.scrollDirection = .horizontal
		layout.itemSize = CGSize(width: 50, height: 50)
		sliderCollectionView.collectionViewLayout = layout
		sliderCollectionView.isPagingEnabled = true
		loadNib()
		sliderCollectionView.dataSource = self
	}

	private func loadNib () {
		let nib = UINib(nibName: "FirstCustomViewCell", bundle: .main)
		sliderCollectionView.register(nib, forCellWithReuseIdentifier: nameCell)
	}

}

extension SecondTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 36
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: nameCell, for: indexPath) as! FirstCustomViewCell
		cell.marvelImage.image = UIImage(named: marvel[indexPath.row])
		return cell
	}
}
