import UIKit

final class HomeViewController: UIViewController {
	struct Config {
		static var heightForRow: CGFloat = 70
	}

	@IBOutlet weak private var tableViewCell: UITableView!
	private let myTableViewCell: String = "MyTableViewCell"
	private let myCell: String = "Cell"

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Sections"
		configTableView()
		loadData()
	}

	private func loadData() {
		BundleManager.share().loadAllUsers()
	}

	private func configTableView () {
		let nib = UINib(nibName: myTableViewCell, bundle: .main)
		tableViewCell.register(nib, forCellReuseIdentifier: myCell)
	}
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return Config.heightForRow
	}

	func numberOfSections(in tableView: UITableView) -> Int {
		let numberOfInSection = BundleManager.share().usersArray.count
		return numberOfInSection
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let numberOfRowsInSection = BundleManager.share().usersArray[section].count
		return numberOfRowsInSection
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: myCell) as! MyTableViewCell
		let user = BundleManager.share().usersArray[indexPath.section][indexPath.row]
		cell.nameLabel.text = user.name
		cell.name = indexPath.row
		return cell
	}
}

