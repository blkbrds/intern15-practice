import UIKit

final class HomeViewController: UIViewController {

	@IBOutlet weak var myColletionView: UICollectionView!
	private let names: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41"]

	override func viewDidLoad() {
		super.viewDidLoad()
		loadNib()
	}
	
	private func loadNib() {
		let nib = UINib(nibName: "MyCollectionViewCell", bundle: .main)
		myColletionView.register(nib, forCellWithReuseIdentifier: "myCell")
		layout()
	}
	
	private func layout() {
		let screenWidth = UIScreen.main.bounds.width - 10
		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		
		layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
		layout.itemSize = CGSize(width: screenWidth / 5, height: (screenWidth / 5) * 5 / 4)
		layout.minimumInteritemSpacing = 15
		layout.minimumLineSpacing = 15
		myColletionView!.collectionViewLayout = layout
	}
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 41
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! MyCollectionViewCell
		let user = names[indexPath.row]
		cell.avatarTextLabel.text = user
		return cell
	}
}
