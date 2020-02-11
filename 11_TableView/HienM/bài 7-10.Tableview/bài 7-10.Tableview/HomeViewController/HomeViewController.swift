import UIKit

class HomeViewController: UIViewController {
	@IBOutlet weak var tableview: UITableView!
	private var names: [[String]] =
		[
			["Tí", "Tèo", "Hùng", "Lam", "Thuỷ", "Tuấn", "Trung", "Hạnh"],
			["Bình", "Khánh", "Toàn", "Tâm", "An"], ["Hương", "Huy", "Quang", "Vân", "Đài", "Tiến"],["Hương", "Huy", "Quang", "Vân", "Đài", "Tiến"],["Hương", "Huy", "Quang", "Vân", "Đài", "Tiến"]
		]
	var titles: [String] = [" Game", "Lớp", "Than","Cho","Meo"]
	var gardentIndexs: [String] = ["G", "L","T","C","M"]


	override func viewDidLoad() {
		super.viewDidLoad()
		tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

	}

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
	func numberOfSections(in tableView: UITableView) -> Int {
		return names.count
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return names[section].count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.textLabel?.text = names[indexPath.section][indexPath.row]
		
		let image = UIImageView(frame: CGRect(x: 200, y: 0, width: 40, height: 40))
		image.image = #imageLiteral(resourceName: "download")
		let label = UILabel(frame: CGRect(x: 40, y: 25, width: 100, height: 30))
		label.text = "name"
		cell.addSubview(image)
		cell.addSubview(label)
		
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

