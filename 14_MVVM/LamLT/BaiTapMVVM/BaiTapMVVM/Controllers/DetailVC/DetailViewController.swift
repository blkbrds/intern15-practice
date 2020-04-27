import UIKit
import MapKit

final class DetailViewController: BaseViewController {
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var detailLabel: UILabel!
    @IBOutlet private weak var detailMapView: MKMapView!
    @IBOutlet private weak var tableView: UITableView!
    
    var tilleDetail = ""
    var favorite = false
    var viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        super.setupUI()
        title = tilleDetail
        let nib = UINib(nibName: "DetailTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "DetailTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        setupScrollView()
        sliderImage()
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "star.fill"), style: .plain, target: self, action: #selector(favoriteViewButton))
        if favorite {
            rightButton.tintColor = .systemYellow
        } else {
            rightButton.tintColor = .black
        }
        navigationItem.rightBarButtonItem = rightButton
    }
    
    override func setupData() {
        super.setupData()
        viewModel.getDataDetail()
    }
    
    private func setupScrollView() {
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(viewModel.images.count), height: 300)
        for index in 0 ..< viewModel.images.count {
            let imageView = UIImageView(image: UIImage(named: viewModel.images[index]))
            imageView.frame = CGRect(x: view.frame.width * CGFloat(index), y: 0, width: view.frame.width, height: 300)
            scrollView.addSubview(imageView)
        }
    }
    
    @objc private func favoriteViewButton() {
        if self.favorite {
            favorite = false
        } else {
            favorite = true
        }
        
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "star.fill"), style: .plain, target: self, action: #selector(favoriteViewButton))
        if self.favorite {
            rightButton.tintColor = .systemYellow
        } else {
            rightButton.tintColor = .black
        }
        navigationItem.rightBarButtonItem = rightButton
    }
    
    private func sliderImage() {
        for index in 0 ..< viewModel.images.count {
            UIView.animate(withDuration: 15, animations: {
                self.scrollView.contentOffset = CGPoint(x: CGFloat(index) * self.view.frame.width, y: 0)
            })
        }
    }
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfRowInSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
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
