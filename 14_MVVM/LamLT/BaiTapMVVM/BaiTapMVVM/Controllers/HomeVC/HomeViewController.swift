import UIKit

final class HomeViewController: BaseViewController {

    // MARK: - Outlet
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var pageControl: UIPageControl!

    // MARK: - Properties
    var viewModel = HomeViewModel()
    var index = 0
    var status: Status = .tableView

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavi()
        configCollectionView()
        setupScrollView()
    }

    // MARK: - Private Functions
    private func configCollectionView() {
        let nib1 = UINib(nibName: Config.homeCollectionViewCell, bundle: .main)
        collectionView.register(nib1, forCellWithReuseIdentifier: Config.homeCollectionViewCell)
        let nib2 = UINib(nibName: Config.homeCellIdentifier, bundle: .main)
        collectionView.register(nib2, forCellWithReuseIdentifier: Config.homeCellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        viewModel.getData()
    }

    private func configNavi() {
        title = "Home"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "collectionview"), style: .plain, target: self, action: #selector(collectionViewButtonTouchUpInside))
    }

    private func setupScrollView() {
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(viewModel.images.count), height: Config.heightScrollContentSize)
        for index in 0 ..< viewModel.images.count {
            let imageView = UIImageView(image: UIImage(named: viewModel.images[index]))
            imageView.frame = CGRect(x: view.frame.width * CGFloat(index), y: 0, width: view.frame.width, height: Config.heightScrollContentSize)
            scrollView.addSubview(imageView)
        }
    }

    // MARK: - Action
    @objc private func tableViewButtonTouchUpInside() {
        status = .tableView
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "collectionview"), style: .plain, target: self, action: #selector(collectionViewButtonTouchUpInside))
        collectionView.reloadData()
    }

    @objc private func collectionViewButtonTouchUpInside() {
        status = .collectionView
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "tableview"), style: .plain, target: self, action: #selector(tableViewButtonTouchUpInside))
        collectionView.reloadData()
    }

    @IBAction private func turnLeftButtonTouchUpInside(_ sender: Any) {
        if index > 0 {
            index -= 1
            UIView.animate(withDuration: Config.animatedDrutionTime, animations: {
                self.scrollView.contentOffset = CGPoint(x: CGFloat(self.index) * self.view.frame.width, y: Config.yOrigin)
                self.pageControl.currentPage = self.index
            })
        }
    }

    @IBAction private func turnRightButtonTouchUpInside(_ sender: Any) {
        if index < viewModel.images.count - 1 {
            index += 1
            UIView.animate(withDuration: Config.animatedDrutionTime, animations: {
                self.scrollView.contentOffset = CGPoint(x: CGFloat(self.index) * self.view.frame.width, y: Config.yOrigin)
                self.pageControl.currentPage = self.index
            })
        }
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.numberOfSections()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRowInSection()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if self.status == .collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Config.homeCellIdentifier, for: indexPath) as! HomeCollectionViewCell
            cell.viewModel = viewModel.viewModelForCell(at: indexPath)
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Config.homeCollectionViewCell, for: indexPath) as! HomeCollectionViewCell
        cell.viewModel = viewModel.viewModelForCell(at: indexPath)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0
        cell.transform = CGAffineTransform(translationX: -200, y: 0)
        UIView.animate(withDuration: TimeInterval(Config.animatedDrutionTime)) {
            cell.alpha = 1
            cell.transform = .identity
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detaiVC = DetailViewController()
        detaiVC.title = viewModel.datas[indexPath.row].name
        detaiVC.isFavorite = viewModel.datas[indexPath.row].favorite
        navigationController?.pushViewController(detaiVC, animated: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if self.status == .collectionView {
            return CGSize(width: UIScreen.main.bounds.width / 2 - 10, height: Config.heightStatusCollectionViewCell)
        }
        return CGSize(width: UIScreen.main.bounds.width, height: Config.heightCollectionViewCell)
    }
}

// MARK: - Config
extension HomeViewController {
    struct Config {
        static var homeCollectionViewCell: String = "HomeCollectionViewCell"
        static var homeCellIdentifier: String = "HomeCell"
        static var heightScrollContentSize: CGFloat = 300
        static var heightImageContent: CGFloat = 300
        static var animatedDrutionTime: TimeInterval = 1
        static var yOrigin: CGFloat = 0
        static var heightStatusCollectionViewCell: CGFloat = 200
        static var heightCollectionViewCell: CGFloat = 100
    }
}
