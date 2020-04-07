import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var contacts: [String] = []
    var titles: [String] = ["Gánh Mẹ"]
    var sectionTitles: [String] {
        return titles.compactMap { $0.first?.uppercased() }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Lời Bài Hát"
        loadData()
        configTableView()
    }

    func loadData() {
        guard let path = Bundle.main.url(forResource: "Content", withExtension: "plist")
            else { return }
        guard let contactsData = NSArray(contentsOf: path) as? [String]
            else { return }
        contacts = contactsData
    }

    func configTableView() {
        let nib = UINib(nibName: "CustomTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.updateTableCell(contentLabel: contacts[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitles
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted \(contacts[indexPath.row])")
               self.contacts.remove(at: indexPath.row)
               self.tableView.beginUpdates()
               self.tableView.deleteRows(at: [indexPath], with: .automatic)
               self.tableView.endUpdates()
            }
    }
}
