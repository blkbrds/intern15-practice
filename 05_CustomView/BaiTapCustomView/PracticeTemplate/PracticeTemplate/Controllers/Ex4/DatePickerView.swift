
import UIKit

protocol DatePickerViewDelegate: class {
    func selectDate(pickerView: DatePickerView, action: DatePickerView.Action, selectDate: Date?)
}

class DatePickerView: UIView {

    @IBOutlet weak var makeView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var datePikerView: UIDatePicker!

    weak var delegate: DatePickerViewDelegate?

    enum Action {
        case hile
        case done
        case cancel
        case show
    }
    func config() {
        makeView.alpha = 0.5
        contentView.alpha = 1
        isHidden = true
    }

    func hide(animation: Bool) {
        if animation {
            UIView.animate(withDuration: 0.5, animations: {
                self.makeView.alpha = 0
                self.contentView.alpha = 0
            }) { (done) in
                self.isHidden = true
            }
        } else {
            makeView.alpha = 0
            contentView.alpha = 0
            isHidden = true
        }
    }

    func show(animation: Bool) {
        self.isHidden = false
        if animation {
            UIView.animate(withDuration: 0.5) {
                self.makeView.alpha = 0.5
                self.contentView.alpha = 1
            }
        } else {
            makeView.alpha = 0.5
            contentView.alpha = 1
        }
    }

    @IBAction func done(_ sender: Any) {
        hide(animation: true)
        guard let delegate = delegate else { return }
        delegate.selectDate(pickerView: self, action: .done, selectDate: datePikerView.date)
    }
    @IBAction func cancel(_ sender: Any) {
        hide(animation: true)
        guard let delegate = delegate else { return }
        delegate.selectDate(pickerView: self, action: .cancel, selectDate: nil)
    }
}
