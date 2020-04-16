import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var scrollPageControl: UIPageControl!

    var viewModel = HomeViewModel()
    var index = 0
    var status: Status = .tableView

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
    }

    override func setupData() {
        super.setupData()
        viewModel.getData()
    }
    
    override func setupUI() {
        super.setupUI()
        title = "Home"
        let nib = UINib(nibName: "HomeTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "HomeTableViewCell")
        setupScrollView()
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
                self.scrollPageControl.currentPage = self.index
            })
        }
    }

    @IBAction func turnRightButtonTouchUpInside(_ sender: Any) {
        if index < viewModel.images.count - 1 {
            index += 1
            UIView.animate(withDuration: 1, animations: {
                self.scrollView.contentOffset = CGPoint(x: CGFloat(self.index) * self.view.frame.width, y: 0)
                self.scrollPageControl.currentPage = self.index
            })
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.viewModel = viewModel.viewModelForCell(at: indexPath)
        return cell
    }
}
