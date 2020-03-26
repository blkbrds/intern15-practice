import UIKit

final class HomeViewController: BaseViewController {

    struct Config {
        static let heightForRow = CGFloat(200)
    }

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Private properties
    private var viewModel = HomeViewModel()
    private let customCell = "CustomCell"

    // MARK: - Override functions
    override func setupUI() {
        super.setupUI()
        title = "HOME"
        let cellNib = UINib(nibName: customCell, bundle: .main)
        tableView.register(cellNib, forCellReuseIdentifier: customCell)
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

    //MARK: - Private functions
    private func loadAPI() {
        print("LOAD API")
        viewModel.loadAPI2 { [weak self] (done, msg) in
            guard let this = self else { return }
            if done {
                this.updateUI()
            } else {
                print("API erorr: \(msg)")
            }
        }
    }

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
        let cell = tableView.dequeueReusableCell(withIdentifier: customCell, for: indexPath) as! CustomCell
        let item = viewModel.musics[indexPath.row]
        cell.configData(title: item.name, artistName: item.artistName)
        if let _ = item.thumbnailImage {
            cell.configData2(thumbnailImage: item.thumbnailImage)
        } else {
            cell.configData2(thumbnailImage: nil)
            viewModel.loadImage(at: indexPath) { [weak self] (done, error, url) in
                guard let _ = self else { return }
                if done, url == item.artworkUrl100 {
                    cell.configData2(thumbnailImage: item.thumbnailImage)
                }
            }
        }

        return cell
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Config.heightForRow
    }
}

