import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var contacts: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        loadData()
        configTableView()
    }
    
    func loadData() {
        guard let path = Bundle.main.url(forResource: "DataArray", withExtension: "plist")
            else { return }
        guard let contactsData = NSArray(contentsOf: path) as? [String]
            else { return }
        contacts = contactsData
    }

    func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "\(contacts[indexPath.row])"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dVC = DetailViewController()
        dVC.name = contacts[indexPath.row]
        self.navigationController?.pushViewController(dVC, animated: true)
    }
}
