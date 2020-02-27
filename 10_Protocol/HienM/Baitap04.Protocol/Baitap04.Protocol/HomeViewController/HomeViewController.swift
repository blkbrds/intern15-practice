import UIKit

final class HomeViewController: UIViewController {

	private var provinceArray: [String] = ["An Giang", "Bà Rịa - Vũng Tàu", "Bắc Giang", "Bắc Kạn", "Bạc Liêu", "Bắc Ninh", "Bến Tre", "Bình Định", "Bình Dương", "Bình Phước", "Bình Thuận", "Cà Mau", "Cao Bằng", "Đắk Lắk", "Đắk Nông", "Điện Biên"]
	private var searchProvince = [String]()
	private var seaching = false

	@IBOutlet weak private var searchBar: UISearchBar!
	@IBOutlet weak private var provinceList: UITableView!
	override func viewDidLoad() {
		super.viewDidLoad()
	}
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if seaching {
			print("1")
			return searchProvince.count
		} else {
			print("2")
			return provinceArray.count
		}
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
		if cell == nil {
			cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
		}
		if seaching {
			cell?.textLabel?.text = searchProvince[indexPath.row]
		} else {
			cell?.textLabel?.text = provinceArray[indexPath.row]
		}
		return cell!
	}
}

extension HomeViewController: UISearchBarDelegate {
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		searchProvince = provinceArray.filter({ $0.prefix(searchText.count) == searchText })
		seaching = true
		provinceList.reloadData()
	}

}
