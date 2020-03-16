import UIKit

final class HomeViewController: UIViewController {

	@IBOutlet weak private var tableview: UITableView!
	private var thePoems: [ThePoem] = []
	private var tableViewCell: String = "TableViewCell"

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "TableView"
		loadData()
		configTableView()
	}

	private func loadData () {
		thePoems = BundleManager.share().getPoems()
	}

	private func configTableView () {
		let nib = UINib(nibName: tableViewCell, bundle: .main)
		tableview.register(nib, forCellReuseIdentifier: tableViewCell)
		tableview.rowHeight = UITableView.automaticDimension
		tableview.estimatedRowHeight = 44
	}
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let numberPoem = thePoems.count
		return numberPoem
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print(BundleManager.share().getPoems()[indexPath.row].poemText)
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCell) as? TableViewCell else {
			let cell = UITableViewCell(style: .default, reuseIdentifier: tableViewCell)
			return cell
		}

		let text = BundleManager.share().getPoems()[indexPath.row]
		cell.poemLabel.text = text.poemText
		return cell
	}
}
