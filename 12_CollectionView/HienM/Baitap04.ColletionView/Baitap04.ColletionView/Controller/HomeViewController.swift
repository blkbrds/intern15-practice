import UIKit

final class HomeViewController: UIViewController {

	@IBOutlet weak private var homeTableView: UITableView!

	private let firstCell: String = "FirstTableViewCell"
	private let secomdCell: String = "SecondTableViewCell"

	override func viewDidLoad() {
		super.viewDidLoad()
		loadFirstNib()
	}

	private func loadFirstNib() {
		let nib1 = UINib(nibName: firstCell, bundle: .main)
		let nib2 = UINib(nibName: secomdCell, bundle: .main)
		homeTableView.register(nib1, forCellReuseIdentifier: firstCell)
		homeTableView.register(nib2, forCellReuseIdentifier: secomdCell)
	}
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 10
	}

	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		if section == 0 { return nil }
		return "Section \(section)"
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let firstCell = tableView.dequeueReusableCell(withIdentifier: firstCell),
			let secondCell = tableView.dequeueReusableCell(withIdentifier: secomdCell) else {
				return UITableViewCell()
		}
		if indexPath.section == 0 {
			return firstCell
		} else {
			return secondCell
		}
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if indexPath.section == 0 {
			return 200
		} else {
			return 50
		}
	}

}




