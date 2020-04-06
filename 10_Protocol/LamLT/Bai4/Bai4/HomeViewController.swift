import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var cityList: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var cityArray: [String] = ["New York","Paris","Lodon","Marid","Roma"]
    private var searchCity = [String]()
    private var seaching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if seaching {
            print("1")
            return searchCity.count
        } else {
            print("2")
            return cityArray.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        if seaching {
            cell?.textLabel?.text = searchCity[indexPath.row]
        } else {
            cell?.textLabel?.text = cityArray[indexPath.row]
        }
        return cell!
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchCity = cityArray.filter({ $0.prefix(searchText.count) == searchText })
        seaching = true
        cityList.reloadData()
    }
}
