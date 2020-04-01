import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var listCityTableView: UITableView!
    let provinceArray: [String] = ["Marid", "Roma", "Paris", "London", "LA", "Ha Loi", "Tokyo", "MatScova", "Catalan", "New York", "Malina", "Berlin"]

    @IBOutlet weak var searchBar: UISearchBar!
   
        private var searchProvince = [String]()
        private var seaching = false

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
            listCityTableView.reloadData()
        }

    }
