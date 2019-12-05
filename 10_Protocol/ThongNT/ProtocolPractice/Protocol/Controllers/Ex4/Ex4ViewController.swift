
import UIKit

final class Ex4ViewController: BaseViewController {

    @IBOutlet private weak var searchBarView: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!

    private var search: [String] = []
    private var cities: [String] = ["Quy Nhơn", "Vũng Tàu", "Hạ Long", "Thanh Hóa", "Buôn Ma Thuột", "Hải Dương", "Long Xuyên", "Cà Mau", "Pleiku", "Phan Thiết", "Yên Bái", "Lạng Sơn", "Điện Biên Phủ", "Thái Bình", "Đồng Hới", "Lào Cai", "Tuy Hòa", "Bắc Giang", "Rạch Giá", "Quảng Ngãi", "Bắc Ninh", "Tam Kỳ", "Hòa Bình", "Vĩnh Yên", "Hà Đông", "Cao Lãnh", "Ninh Bình", "Phan Rang - Tháp Chàm", "Sóc Trăng", "Hà Tĩnh", "Sơn Tây", "Hội An", "Phủ Lý", "Sơn La", "Móng Cái", "Hưng Yên", "Vĩnh Long", "Đông Hà", "Bến Tre", "Tân An", "Kon Tum", "Trà Vinh", "Bảo Lộc", "Tuyên Quang", "Bạc Liêu", "Vị Thanh", "Hà Giang", "Cam Ranh"]

    override func viewDidLoad() {
        super.viewDidLoad()
        search = cities
    }

    override func setupUI() {
        super.setupUI()
        self.title = "Search"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ChoPhuoc")
        tableView.dataSource = self
        tableView.delegate = self
        searchBarView.delegate = self
        searchBarView.placeholder = "Search city"
    }
}

extension Ex4ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return search.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChoPhuoc", for: indexPath)
        cell.textLabel?.text = search[indexPath.row]
        return cell
    }
}

extension Ex4ViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        search = cities
        searchBar.resignFirstResponder()
        tableView.reloadData()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let upperText = searchText.uppercased()
        search = cities.filter { $0.uppercased().hasPrefix(upperText) }
        tableView.reloadData()
    }
}
