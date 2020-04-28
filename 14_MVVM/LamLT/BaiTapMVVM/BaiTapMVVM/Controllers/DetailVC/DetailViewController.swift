import UIKit
import MapKit

final class DetailViewController: BaseViewController {

    //MARK: - Outlet
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var detailLabel: UILabel!
    @IBOutlet private weak var detailMapView: MKMapView!
    @IBOutlet private weak var tableView: UITableView!

    //MARK: - Properties
    var isFavorite = false
    var detailsTitle: String = ""
    var viewModel = DetailViewModel()

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        sliderImage()
        viewModel.getDataDetail()
    }

    //MARK: - Private Functions
    private func configTableView() {
        let nib = UINib(nibName: Config.detailTableViewCell, bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: Config.detailTableViewCell)
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func configUINavi() {
        title = Config.detailsTitle
        let rightBarButton = UIBarButtonItem(image: UIImage(systemName: "star.fill"), style: .plain, target: self, action: #selector(favoriteViewButtonTouchUpInside))
        if isFavorite {
            rightBarButton.tintColor = .systemYellow
        } else {
            rightBarButton.tintColor = .black
        }
        navigationItem.rightBarButtonItem = rightBarButton
    }

    private func setupScrollView() {
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(viewModel.images.count), height: Config.heightSrcollContentSize)
        for index in 0 ..< viewModel.images.count {
            let imageView = UIImageView(image: UIImage(named: viewModel.images[index]))
            imageView.frame = CGRect(x: view.frame.width * CGFloat(index), y: 0, width: view.frame.width, height: Config.heightImageView)
            scrollView.addSubview(imageView)
        }
    }

    private func sliderImage() {
        for index in 0 ..< viewModel.images.count {
            UIView.animate(withDuration: 1, animations: {
                self.scrollView.contentOffset = CGPoint(x: CGFloat(index) * self.view.frame.width, y: 0)
            })
        }
    }

    // MARK: - Action
    @objc private func favoriteViewButtonTouchUpInside() {
        if self.isFavorite {
            isFavorite = false
        } else {
            isFavorite = true
        }
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfRowInSection()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowInSection()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Config.detailTableViewCell, for: indexPath) as! DetailTableViewCell
        cell.viewModel = viewModel.viewModelForCell(at: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        cell.transform = CGAffineTransform(translationX: 0, y: 200)
        UIView.animate(withDuration: 1) {
            cell.alpha = 1
            cell.transform = .identity
        }
    }
}

// MARK: - Config
extension DetailViewController {
    struct Config {
        static var detailsTitle: String = ""
        static var detailTableViewCell: String = "DetailTableViewCell"
        static var heightSrcollContentSize: CGFloat = 300
        static var heightImageView: CGFloat = 300
    }
}
