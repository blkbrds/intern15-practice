import UIKit

final class HomeViewController: BaseViewController {

    // MARK: -IBOutlets
    @IBOutlet weak var tableview: UITableView!

    var viewmodel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - config
    override func setupUI() {
        super.setupUI()
        self.title = "Home"

        let nib = UINib(nibName: "HomeTableViewCell", bundle: .main)
        tableview.register(nib, forCellReuseIdentifier: "cell")

        let resetTabbarItem = UIBarButtonItem(image: UIImage(named: "f5"), style: .plain, target: self, action: #selector(loadAPI))
        self.navigationItem.rightBarButtonItem = resetTabbarItem
    }

    override func setupData() {

    }

    private func updateView() {
        tableview.reloadData()
    }

    @objc func loadAPI() {
        viewmodel.loadAPI2 { (done, msg) in
            if done {
                print("LOAD API")
                self.updateView()
            } else {
                print("API ERROR : \(msg)")
            }
        }
    }
}

//MARK: - Tableview Delegate & Datasource
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewmodel.numberOfRowsInSection()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell

        let item = viewmodel.musics[indexPath.row]
        cell.titleLabel.text = item.name
        cell.artistNameLabel.text = item.artistName

        if item.thumbnailImage != nil {
            cell.thumbnail.image = item.thumbnailImage
        } else {
            cell.thumbnail.image = nil

            //downloader
            Networking.shared().downloadImage(url: item.artworkUrl100) { (image) in
                if let image = image {
                    cell.thumbnail.image = image
                    item.thumbnailImage = image
                } else {
                    cell.thumbnail.image = nil
                }
            }
        }

        return cell
    }
}
