import UIKit

class DatePickerViewController: UIViewController {
	@IBOutlet weak var dateTextField: UITextField!

	var datePickerView: DatePickerView?

	override func viewDidLoad() {
		super.viewDidLoad()
		datePickerView = Bundle.main.loadNibNamed("DatePickerView", owner: self, options: nil)?.first as? DatePickerView
		datePickerView?.frame = CGRect(x: 0, y: view.bounds.height - 400, width: view.bounds.width, height: 400)
		view.addSubview(datePickerView!)
		datePickerView?.delegate = self
	}
}

extension DatePickerViewController: DatePickerDeligate {
	func datePickerDeligate(seleteDate: Date?) {
		guard let date = seleteDate else { return }
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "MMMM ,dd, yyyy"
		let dateString = dateFormatter.string(from: date)
		dateTextField.text = dateString
	}
}
