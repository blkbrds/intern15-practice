
import UIKit

class Ex4ViewController: BaseViewController {


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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Ex4"
    }

    override func setupData() {
    }


}
extension Ex4ViewController: DatePickerViewDelegate {
    func selectDate(pickerView: DatePickerView, action: DatePickerView.Action, selectDate: Date?) {
        guard let date = selectDate else { return }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        let dateString = dateFormatter.string(from: date)
        dateTextField.text = dateString
    }
}

extension Ex4ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        datePickerView?.show(animation: true)
        view.endEditing(true)
    }
}
