

import UIKit

final class Ex2ViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    private let cellIndentifier: String = "UICollectionViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        randomHeightForCell()
    }

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
        for _ in 0..<Dummy.numberOfItems {
            Dummy.heightArray.append(CGFloat.random(in: 50...200))
        }
    }
}

extension Ex2ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        return Dummy.heightArray[indexPath.item]
    }
}

extension Ex2ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Dummy.numberOfItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIndentifier, for: indexPath)
        cell.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        return cell
    }
}

extension Ex2ViewController: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return Dummy.sectionInset }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let choose = indexPath.item % 3
        let width = Dummy.widthArray
        switch choose {
        case 0:
            return CGSize(width: width, height: 50)
        case 1:
            return CGSize(width: width, height: 50)
        default:
            return CGSize(width: width, height: 200)
        }
    }
}

extension Ex2ViewController {
    struct Dummy {
        static let numberOfItems: Int = 48
        static var heightArray: [CGFloat] = []
        static let sectionInset: UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        static let widthArray = (UIScreen.main.bounds.width - 40) / 3
    }
}
