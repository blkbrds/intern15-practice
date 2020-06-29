import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var contacts: [[String]] = [[]]
    var titles: [String] = ["Đông Vật", "Thức Ăn"]
    
    var sectionTitles: [String] {
        return titles.compactMap { $0.first?.uppercased() }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        loadData()
        configTableView()
    }
    
    func loadData() {
        guard let path = Bundle.main.url(forResource: "DataList", withExtension: "plist"), let contactsData = NSArray(contentsOf: path) as? [[String]]
        else { return }
        contacts = contactsData
    }

    func configTableView() {
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableview.dataSource = self
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return contacts.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = contacts[indexPath.section][indexPath.row]
        let nameLabel = UILabel(frame: CGRect(x: 40, y: 25, width:  199, height: 30))
        nameLabel.text = "Name"
        nameLabel.textColor = .red
        cell.addSubview(nameLabel)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected cell: \(contacts[indexPath.section][indexPath.row])")
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitles
    }
}

