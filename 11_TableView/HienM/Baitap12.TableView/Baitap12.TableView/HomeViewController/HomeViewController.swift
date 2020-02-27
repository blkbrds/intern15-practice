import UIKit

final class HomeViewController: UIViewController {

	@IBOutlet weak private var addTextField: UITextField!
	@IBOutlet weak private var tableView: UITableView!
	@IBOutlet weak private var editButton: UIBarButtonItem!

	private var videos: [String] = ["FaceBook", "Instargram", "Tiktok"]
	private var myCell: String = "cell"
	override func viewDidLoad() {
		super.viewDidLoad()
		configTableView()
	}

	private func configTableView () {
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: myCell)
	}

	@IBAction private func editButtonTapped(_ sender: Any) {
		insertVideoNameTitle ()
	}

	private func insertVideoNameTitle () {
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
		let cell = tableView.dequeueReusableCell(withIdentifier: myCell, for: indexPath)
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
