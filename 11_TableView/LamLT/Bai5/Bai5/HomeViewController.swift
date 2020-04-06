import UIKit

class HomeViewController: UIViewController {
    
    var contactsData: [String] = []
    var contacs: [String] = []

    @IBOutlet weak var nameSearchBar: UISearchBar!
    @IBOutlet weak var nameTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search Home"
        loadData()
        configTableView()
        configSearchBar()
    }
    
    func configSearchBar() {
        nameSearchBar.delegate = self
    }
    
    func search(keyword: String) {
        contacs = getContacs(keyword: keyword)
        nameTableView.reloadData()
    }
    
    func getContacs(keyword: String) -> [String] {
        if keyword.trimmingCharacters(in: CharacterSet(charactersIn: " ")) ==  "" {
            return contactsData
        } else {
            var data: [String] = []
            for contact in contactsData {
                if let _ = contact.lowercased().range(of: keyword.lowercased()) {
                    data.append(contact)
                }
            }
            return data
        }
    }
    
    func loadData() {
        guard let path = Bundle.main.url(forResource: "nameList", withExtension: "plist")
            else { return }
        guard let contactsData = NSArray(contentsOf: path) as? [String]
            else { return }
        self.contactsData = contactsData
        self.contacs = contactsData
    }
    
    func configTableView() {
        nameTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        nameTableView.dataSource = self
    }
    
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        var currentText = ""
        if let searchBarText = searchBar.text {
            currentText = searchBarText
        }
        let keyword  = (currentText as NSString).replacingCharacters(in: range, with: text)
        search(keyword: keyword)
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyWord = searchBar.text else {
            search(keyword: "")
            return
        }
        search(keyword: keyWord)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        search(keyword: "")
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = contacs[indexPath.row]
        return cell
    }
}
