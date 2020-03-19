import UIKit
protocol MyDatePickerViewDelegate: class {
    func selectDate(selectDate: Date?)
}

final class DatePickerView: UIView {
    // MARK: - IBOutlet
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var datePicker: UIDatePicker!
    
    // MARK: - Declare Variable
    weak var delegate: MyDatePickerViewDelegate?
    
    // MARK: - function
    func setupUI() {
        contentView.alpha = 1
        isHidden = true
    }
    
    func show() {
        self.isHidden = false
        UIView.animate(withDuration: 0.5, animations: {
            self.contentView.alpha = 1
        })
    }
    
    // MARK: - IBOutlet
    @IBAction func doneTouchUpInside(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            self.contentView.alpha = 0
        }) { (done) in
            self.isHidden = true
        }
        guard let delegate = delegate else { return }
        delegate.selectDate(selectDate: datePicker.date)
    }
}
