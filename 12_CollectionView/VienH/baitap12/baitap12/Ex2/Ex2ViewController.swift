

import UIKit

final class Ex2ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    private var heightArray: [CGFloat] = []
    private let numberOfItems: Int = 48
    private let cellIndentifier: String = "UICollectionViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        randomHeightForCell()
    }

    //MARK: - Private functions
    private func setupUI() {
        title = "Custom Cell"
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIndentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        if let layout = collectionView.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
    }

    private func randomHeightForCell() {
        for _ in 0..<numberOfItems {
            heightArray.append(CGFloat.random(in: 50...200))
        }
    }
}

extension Ex2ViewController: UICollectionViewDelegate, UICollectionViewDataSource, PinterestLayoutDelegate {

    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        return heightArray[indexPath.item]
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIndentifier, for: indexPath)
        cell.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        return cell
    }
}
