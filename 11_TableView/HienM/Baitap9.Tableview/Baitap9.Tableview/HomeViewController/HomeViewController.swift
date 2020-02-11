import UIKit

class HomeViewController: UIViewController {

	@IBOutlet weak var tableViewCell: UITableView!

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Sections"
		configTableView()
		loadData()
	}
	
	func loadData(){
		BundleManager.share().loadAllUsers()
	}
	
	func configTableView () {
		let nib = UINib(nibName: "MyTableViewCell", bundle: .main)
		tableViewCell.register(nib, forCellReuseIdentifier: "myCell")
	}
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 70
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		let  numberOfInSection = BundleManager.share().usersArray.count
		return numberOfInSection
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let  numberOfRowsInSection = BundleManager.share().usersArray[section].count
		return numberOfRowsInSection
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as!  MyTableViewCell
		let user = BundleManager.share().usersArray[indexPath.section][indexPath.row]
		cell.nameLabel.text = user.name
		cell.name = indexPath.row
		return cell
	}
}
