import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var contacts: [[String]] = [[]]
    var titles: [String] = ["ANIMAL","FOOD"]
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
        guard let path = Bundle.main.url(forResource: "NameList", withExtension: "plist")
            else { return }
        guard let contactsData = NSArray(contentsOf: path) as? [[String]]
            else { return }
        contacts = contactsData
    }
    
    func configTableView() {
        let nib = UINib(nibName: "CustomTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.updateTableCell(avatar: "jao", contactName: contacts[indexPath.section][indexPath.row], subTitle: "Click")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitles
    }
}

extension HomeViewController: CustomTableViewCellDelegate {
    func customTableView(customTableView: CustomTableViewCell, needPerformAction action: CustomTableViewCell.Action) {
        switch action {
        case .sendTitle(let title):
            print("Click \(title)")
        }
    }
}
