
import UIKit

class HomeViewController: UIViewController {

	@IBOutlet weak var SearchBar: UISearchBar!
	@IBOutlet weak var tableview: UITableView!

	private var users: [User] = []
	private var userSearchs: [User] = []
	private var searching = false

	override func viewDidLoad() {
		super.viewDidLoad()
		setupIU()
		getData()
	}

	private func setupIU () {
		title = "Danh Sach"
	}

	private func getData() {
		users = BundleManager.shared.getUsers()
		userSearchs = users
	}
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if searching {
			return userSearchs.count
		} else {
			return users.count
		}
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
		if cell == nil {
			cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
		}
		let user = users[indexPath.row]
		let userSearch = userSearchs[indexPath.row]

		if searching {
			cell?.textLabel?.text = userSearch.name
		} else {
			cell?.textLabel?.text = user.name
		}
		return cell!
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
		userSearchs = users.filter({ $0.name.prefix(searchText.count) == searchText })
		searching = true
		tableview.reloadData()
	}
}
