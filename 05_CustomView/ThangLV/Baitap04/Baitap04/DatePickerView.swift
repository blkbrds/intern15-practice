import UIKit

protocol DatePickerViewDelegate: class {
    func clickDoneButton()
}

class DatePickerView: UIView {
    
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var datePickerView: UIDatePicker!
    weak var delegate: DatePickerViewDelegate?
    
    @IBAction func pickerDateClickedButton(_ sender: Any) {
        delegate?.clickDoneButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
}
