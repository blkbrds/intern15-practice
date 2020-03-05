import UIKit

final class HomeViewController: BaseViewController {

	// MARK: - Outlets
	@IBOutlet private weak var tableView: UITableView!

	// MARK: - Properties
	private var musicTableViewCell: String = "MusicTableViewCell"
	var viewmodel = HomeViewModel()

	// MARK: - Base config
	override func setupUI() {
		title = "Home"
		loadNib()
		configTableView()
		setupTarBar()
	}

	// MARK: - Private
	private func configTableView() {
		tableView.delegate = self
		tableView.dataSource = self
		tableView.reloadData()
	}

	private func loadNib() {
		let nib = UINib(nibName: musicTableViewCell, bundle: .main)
		tableView.register(nib, forCellReuseIdentifier: musicTableViewCell)
	}

	private func setupTarBar() {
		let resetTabbarItem = UIBarButtonItem(image: UIImage(named: "reset"), style: .plain, target: self, action: #selector(loadAPI))
		navigationItem.rightBarButtonItem = resetTabbarItem
	}

	@objc private func loadAPI() {
		viewmodel.getHotMusic { (done, msg) in
			if done {
				self.tableView.reloadData()
			} else {
				print("API ERROR: \(msg)")
			}
		}
	}

}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewmodel.musics.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: musicTableViewCell, for: indexPath) as? MusicTableViewCell else { return UITableViewCell(style: .default, reuseIdentifier: musicTableViewCell) }
		cell.viewModel = viewmodel.getMusicTableViewCellModel(atIndexPath: indexPath)
		if let imageURL = cell.viewModel?.imageUrl {
			viewmodel.downloadImage(withURL: imageURL) { image in
				cell.updateSongImage(image: image)
			}
		}
		return cell
	}
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return Config.heightOfRow
	}

	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 100, 100, 0)
		cell.layer.transform = rotationTransform
		cell.alpha = 0.3
		UIView.animate(withDuration: 0.5) {
			cell.layer.transform = CATransform3DIdentity
			cell.alpha = 1
		}
		cell.layer.allowsEdgeAntialiasing = false
		cell.layer.cornerRadius = 10
		cell.clipsToBounds = true
	}
}

// MARK: - Configuration
extension HomeViewController {

	struct Config {
		static let heightOfRow: CGFloat = 200
		
	}
}
