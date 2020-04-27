import UIKit

final class DatePickerViewController: UIViewController {
  
  @IBOutlet weak var dateTextField: UITextField!
  
  var datePickerView: DatePickerView?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    datePickerView = Bundle.main.loadNibNamed("DatePickerView", owner: self, options: nil)?.first as? DatePickerView
    datePickerView?.config()
    datePickerView?.delegate = self
    view.addSubview(datePickerView!)
    dateTextField.delegate = self
  }
}

extension DatePickerViewController: DatePickerViewDelegate {
  func datePickerView(_ pickerView: DatePickerView, action: DatePickerView.Action, selectDate: Date?) {
    guard let date = selectDate else { return }
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMMM dd, yyyy"
    let dateString = dateFormatter.string(from: date)
    dateTextField.text = dateString
  }
}

extension DatePickerViewController: UITextFieldDelegate {
  func textFieldDidBeginEditing(_ textField: UITextField) {
    datePickerView?.show(animation: true)
    view.endEditing(true)
  }
}
