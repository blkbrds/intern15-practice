import UIKit

final class HomeViewController: UIViewController {

	@IBOutlet weak private var homeTableView: UITableView!

	private let nameFirstCell: String = "FirstTableViewCell"
	private let nameSecomdCell: String = "SecondTableViewCell"

	override func viewDidLoad() {
		super.viewDidLoad()
		loadFirstNib()
	}

	private func loadFirstNib() {
		let nib1 = UINib(nibName: nameFirstCell, bundle: .main)
		let nib2 = UINib(nibName: nameSecomdCell, bundle: .main)
		homeTableView.register(nib1, forCellReuseIdentifier: nameFirstCell)
		homeTableView.register(nib2, forCellReuseIdentifier: nameSecomdCell)
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
		if indexPath.section == 0 {
			guard let cell = tableView.dequeueReusableCell(withIdentifier: nameFirstCell) else {
				let cell = UITableViewCell(style: .default, reuseIdentifier: nameFirstCell)
				return cell
			}
			return cell
		} else {
			guard let cell = tableView.dequeueReusableCell(withIdentifier: nameSecomdCell) else {
				let cell = UITableViewCell(style: .default, reuseIdentifier: nameSecomdCell)
				return cell
			}
			return cell
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




