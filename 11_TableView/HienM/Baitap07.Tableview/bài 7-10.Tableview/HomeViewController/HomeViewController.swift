import UIKit

final class HomeViewController: UIViewController {

	@IBOutlet weak private var tableview: UITableView!
	private var defaultCell: String = "cell"
	private var name: String = "Name"
	private var names: [[String]] =
		[
			["Tí", "Tèo", "Hùng", "Lam", "Thuỷ", "Tuấn", "Trung", "Hạnh"],
			["Bình", "Khánh", "Toàn", "Tâm", "An"], ["Hương", "Huy", "Quang", "Vân", "Đài", "Tiến"], ["Hương", "Huy", "Quang", "Vân", "Đài", "Tiến"], ["Hương", "Huy", "Quang", "Vân", "Đài", "Tiến"]
		]
	private var titles: [String] = [" Game", "Lớp", "Than", "Cho", "Meo"]
	private var gardentIndexs: [String] = ["G", "L", "T", "C", "M"]

	override func viewDidLoad() {
		super.viewDidLoad()
		tableview.register(UITableViewCell.self, forCellReuseIdentifier: defaultCell)
	}
}

extension HomeViewController: UITableViewDataSource {

	func numberOfSections(in tableView: UITableView) -> Int {
		return names.count
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return names[section].count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: defaultCell, for: indexPath)
		cell.textLabel?.text = names[indexPath.section][indexPath.row]

		let imageView = UIImageView(frame: CGRect(x: 200, y: 0, width: 40, height: 40))
		imageView.image = #imageLiteral(resourceName: "download")
		let nameLabel = UILabel(frame: CGRect(x: 40, y: 25, width: 100, height: 30))
		nameLabel.text = name
		cell.addSubview(imageView)
		cell.addSubview(nameLabel)
		return cell
	}

	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return titles[section]
	}

	func sectionIndexTitles(for tableView: UITableView) -> [String]? {
		return gardentIndexs
	}

	func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
		return index
	}
}

