import UIKit

final class HomeViewController: BaseViewController {
    
    //MARK: - Struct
    struct Dummy {
        static let heightForTableViewRow: CGFloat = 200
    }
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    private var viewModel = HomeViewModel()
    private let cellName = "CustomCell"
    
    override func setupUI() {
        super.setupUI()
        title = "HOME"
        let cellNib = UINib(nibName: cellName, bundle: .main)
        tableView.register(cellNib, forCellReuseIdentifier: cellName)
        let resetTabbarItem = UIBarButtonItem(image: UIImage(named: "refresh"), style: .plain, target: self, action: #selector(resetButtonTouchUpInside))
        navigationItem.rightBarButtonItem = resetTabbarItem
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func setupData() {
        super.setupData()
    }
    
    
    @objc private func resetButtonTouchUpInside(_ sender: UIBarButtonItem) {
        loadAPI()
    }
    
   private func loadAPI() {
        print("LOAD API")
        viewModel.loadAPI2 { (done, msg) in
            if done {
                self.updateUI()
            } else {
                print("API error: \(msg)")
            }
        }
    }
    
    //MARK: - Private functions
    private func updateUI() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! CustomCell
        let item = viewModel.musics[indexPath.row]
        cell.configData(title: item.name, artistName: item.artistName)
        
        if item.thumbnailImage != nil {
            cell.configData2(thumbnailImage: item.thumbnailImage)
        } else {
            cell.configData2(thumbnailImage: nil)
            //downloader
            Networking.shared().downloadImage(url: item.artworkUrl100) { (image) in
                if let image = image {
                    cell.configData2(thumbnailImage: image)
                    item.thumbnailImage = image
                } else {
                    cell.configData2(thumbnailImage: nil)
                }
            }
        }
        return cell
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Dummy.heightForTableViewRow
    }
}
