
import UIKit

class HomeViewController: UIViewController {

	@IBOutlet weak var addTextField: UITextField!
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var editButton: UIBarButtonItem!

	var videos: [String] = ["FaceBook", "Instargram", "Tiktok"]

	override func viewDidLoad() {
		super.viewDidLoad()
		configTableView()
	}

	func configTableView () {
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
	}

	@IBAction func editButtonTapped(_ sender: Any) {

		insertVideoNameTitle ()
	}

	func insertVideoNameTitle () {
		videos.append(addTextField.text!)
		let indexPath = IndexPath(row: videos.count - 1, section: 0)
		tableView.beginUpdates()
		tableView.insertRows(at: [indexPath], with: .automatic)
		tableView.endUpdates()
		addTextField.text = ""
		view.endEditing(true)
	}
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return videos.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.textLabel?.text = videos[indexPath.row]
		return cell
	}

	func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}

	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			videos.remove(at: indexPath.row)
			tableView.beginUpdates()
			tableView.deleteRows(at: [indexPath], with: .automatic)
			tableView.endUpdates()
		}
	}
}
