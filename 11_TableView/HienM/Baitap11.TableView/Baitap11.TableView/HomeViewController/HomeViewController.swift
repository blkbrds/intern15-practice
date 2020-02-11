import UIKit

class HomeViewController: UIViewController {

	@IBOutlet weak var tableview: UITableView!
	var users: [ThePoem] = []

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "TableView"
		loadData()
		configTableView()
	}

	func loadData () {
		users = BundleManager.share().getPoems()
	}

	func configTableView () {
		let nib = UINib(nibName: "TableViewCell", bundle: .main)
		tableview.register(nib, forCellReuseIdentifier: "myCell")
		tableview.rowHeight = UITableView.automaticDimension
		tableview.estimatedRowHeight = 44
	}
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let numberPoem = users.count
		return numberPoem
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print(BundleManager.share().getPoems()[indexPath.row].poemText)
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? TableViewCell else {
			let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
			return cell
		}

		let text = BundleManager.share().getPoems()[indexPath.row]
		cell.poemLabel.text = text.poemText
		return cell
	}
}
