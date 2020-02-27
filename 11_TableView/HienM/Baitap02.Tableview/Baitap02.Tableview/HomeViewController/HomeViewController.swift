
import UIKit

final class HomeViewController: UIViewController {

	@IBOutlet weak private var SearchBar: UISearchBar!
	@IBOutlet weak private var tableView: UITableView!

	private var users: [User] = []
	private var searchUsers: [User] = []
	private var searching: Bool = false
	private var defaultCell: String = "cell"

	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
		getData()
	}

	private func setupUI () {
		title = "Danh Sach"
	}

	private func getData() {
		users = BundleManager.shared.getUsers()
		searchUsers = users
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: defaultCell)
	}
}

extension HomeViewController: UITableViewDataSource{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if searching {
			return searchUsers.count
		} else {
			return users.count
		}
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: defaultCell, for: indexPath)
		let user = users[indexPath.row]
		let userSearch = searchUsers[indexPath.row]

		if searching {
			cell.textLabel?.text = userSearch.name
		} else {
			cell.textLabel?.text = user.name
		}
		return cell
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let vc = NavigationViewController()
		let user = users[indexPath.row]
		vc.nameText = user.name
		navigationController?.pushViewController(vc, animated: true)
	}
}

extension HomeViewController: UISearchBarDelegate {
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		searchUsers = users.filter({ $0.name.prefix(searchText.count) == searchText })
		searching = true
		tableView.reloadData()
	}
}

