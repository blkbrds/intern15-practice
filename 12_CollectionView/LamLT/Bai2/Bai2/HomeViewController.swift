import UIKit

class HomeViewController: UIViewController {

    var datas: [Data] = Data.getDummyDatas()
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        configCollectionView()
        if let layout = collectionView?.collectionViewLayout as? CellLayout {
                   layout.delegate = self
               }
    }

    func configCollectionView() {
        let nib = UINib(nibName: "SubViewCellCollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        datas.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SubViewCellCollectionViewCell
        let item = datas[indexPath.row]
        cell.subCellLabel.text = String(item.number)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.bottom + 10)) / 2
        return CGSize(width: itemSize, height: itemSize)
    }

}

extension HomeViewController: CellLayoutDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        let random = arc4random_uniform(4) + 1
        return CGFloat(random * 100)
    }
}
