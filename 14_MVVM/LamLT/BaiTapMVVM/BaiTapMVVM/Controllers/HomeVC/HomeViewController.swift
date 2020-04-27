import UIKit

class HomeViewController: BaseViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var viewModel = HomeViewModel()
    var index = 0
    var status: Status = .tableView
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func setupData() {
        super.setupData()
        viewModel.getData()
    }
    
    override func setupUI() {
        super.setupUI()
        title = "Home"
//        let nib = UINib(nibName: "HomeTableViewCell", bundle: .main)
//        tableView.register(nib, forCellReuseIdentifier: "HomeTableViewCell")
        let nib1 = UINib(nibName: "HomeCollectionViewCell", bundle: .main)
        collectionView.register(nib1, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        let nib2 = UINib(nibName: "HomeCell", bundle: .main)
        collectionView.register(nib2, forCellWithReuseIdentifier: "HomeCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        setupScrollView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "collectionview"), style: .plain, target: self, action: #selector(collectionViewButton))
    }
    
    @objc private func tableViewButton() {
        self.status = .tableView
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "collectionview"), style: .plain, target: self, action: #selector(collectionViewButton))
        collectionView.reloadData()
    }
    
    @objc private func collectionViewButton() {
        self.status = .collectionView
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "tableview"), style: .plain, target: self, action: #selector(tableViewButton))
        collectionView.reloadData()
    }
    
    private func setupScrollView() {
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(viewModel.images.count), height: 300)
        for index in 0 ..< viewModel.images.count {
            let imageView = UIImageView(image: UIImage(named: viewModel.images[index]))
            imageView.frame = CGRect(x: view.frame.width * CGFloat(index), y: 0, width: view.frame.width, height: 300)
            scrollView.addSubview(imageView)
        }
    }
    
    @IBAction func turnLeftButtonTouchUpInside(_ sender: Any) {
        if index > 0 {
            index -= 1
            UIView.animate(withDuration: 1, animations: {
                self.scrollView.contentOffset = CGPoint(x: CGFloat(self.index) * self.view.frame.width, y: 0)
                self.pageControl.currentPage = self.index
            })
        }
    }
    
    @IBAction func turnRightButtonTouchUpInside(_ sender: Any) {
        if index < viewModel.images.count - 1 {
            index += 1
            UIView.animate(withDuration: 1, animations: {
                self.scrollView.contentOffset = CGPoint(x: CGFloat(self.index) * self.view.frame.width, y: 0)
                self.pageControl.currentPage = self.index
            })
        }
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRowInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if self.status == .collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCollectionViewCell
            cell.viewModel = viewModel.viewModelForCell(at: indexPath)
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.viewModel = viewModel.viewModelForCell(at: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0
        cell.transform = CGAffineTransform(translationX: -200, y: 0)
        UIView.animate(withDuration: 1) {
            cell.alpha = 1
            cell.transform = .identity
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detaiVC = DetailViewController()
        detaiVC.tilleDetail = viewModel.datas[indexPath.row].name
        detaiVC.favorite = viewModel.datas[indexPath.row].favorite
        navigationController?.pushViewController(detaiVC, animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if self.status == .collectionView {
            return CGSize(width: UIScreen.main.bounds.width / 2 - 10, height: 200)
        }
        return CGSize(width: UIScreen.main.bounds.width, height: 100)
    }
}
