import UIKit

final class CustomDatePickerViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var dateTextField: UITextField!
    
    // MARK: - Declare Variable
    private var datePickerView: DatePickerView?
    
    //MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        datePickerView = Bundle.main.loadNibNamed("DatePickerView", owner: self, options: nil)?.first as? DatePickerView
        datePickerView?.delegate = self
        view.addSubview(datePickerView!)
        dateTextField.delegate = self
    }
}

// MARK: - Extension
extension CustomDatePickerViewController: MyDatePickerViewDelegate {
    func selectDate(selectDate: Date?) {
        guard let date = selectDate else { return }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        let dateString = dateFormatter.string(from: date)
        dateTextField.text = dateString
    }
}

extension CustomDatePickerViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        datePickerView?.show()
        view.endEditing(true)
    }
}

