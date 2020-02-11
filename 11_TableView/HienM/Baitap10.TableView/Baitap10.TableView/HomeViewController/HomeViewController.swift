
import UIKit

class HomeViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	var users: [Contact] = []

	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
		configTableView()

	}
	
	func setupUI() {
		DispatchQueue.global().async {
			self.users = PhoneContacts.share().contacts
			DispatchQueue.main.async {
				self.tableView.reloadData()
			}
		}
	}
	
	func configTableView() {
		let nib = UINib(nibName: "ContactCell", bundle: .main)
		tableView.register(nib, forCellReuseIdentifier: "contactCell")
	}
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let phones = PhoneContacts.share().contacts.count
		return phones
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return PhoneContacts.share().contacts.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell") as? ContactCell else {
			let cell = UITableViewCell(style: .default, reuseIdentifier: "contactCell")
			return cell
		}
		
		let contact = PhoneContacts.share().contacts[indexPath.row]
		cell.imageView?.image = UIImage(data: contact.avatarData ?? Data())
		cell.userName.text = contact.name
		cell.phoneNumberLabel.text = contact.phoneNumber
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 100
	}
	
	func sectionIndexTitles(for tableView: UITableView) -> [String]? {
		return PhoneContacts.share().contacts.map({ $0.name?.first?.uppercased() ?? "" })
	}
}

