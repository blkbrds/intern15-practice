import SwiftUI
protocol DatePickerDeligate: class {
	func datePickerDeligate(seleteDate: Date?)
}

class DatePickerView: UIView {

	@IBOutlet weak var cancelButton: UIButton!
	@IBOutlet weak var doneButton: UIButton!
	@IBOutlet weak var datePicker: UIDatePicker!

	weak var delegate: DatePickerDeligate?

	override init(frame: CGRect) {
		super.init(frame: frame)
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}

	@IBAction func doneButton(_ sender: Any) {
		UIView.animate(withDuration: 0.5, delay: 0, animations: {
			self.datePicker.alpha = 1
		}) { (done) in
			self.datePicker.isHidden = true
			self.doneButton.isHidden = true
		}
		guard let delegate = delegate else { return }
		delegate.datePickerDeligate(seleteDate: datePicker.date)
	}

	@IBAction func cancelButton(_ sender: Any) {
		UIView.animate(withDuration: 0.5, delay: 0, animations: {
			self.datePicker.alpha = 1
		}) { (done) in
			self.datePicker.isHidden = false
			self.doneButton.isHidden = false
		}
		guard let delegate = delegate else { return }
		delegate.datePickerDeligate(seleteDate: nil)
	}
}
