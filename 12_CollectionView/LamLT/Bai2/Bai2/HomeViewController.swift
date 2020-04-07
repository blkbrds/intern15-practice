import UIKit

class HomeViewController: UIViewController {
    var datas: [Data] = Data.getDummyDatas()
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        configCollectionView()
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
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let cellHeight = arc4random_uniform(100) + 200
      print("cell height: \(cellHeight)")
      return CGSize(width: collectionView.bounds.size.width/2 - 1, height: CGFloat(cellHeight))
    }
}

