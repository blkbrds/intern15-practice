import UIKit

class TextField: UIView {

    @IBOutlet weak var textField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textField.frame = CGRect(x: 0, y: 0, width: 70, height: 20)
        addSubview(textField)
        
        let datePicker: DatePickerView? = nil
        datePicker?.delegate = self as DatePickerViewDelegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension TextField: DatePickerViewDelegate {
    func clickDoneButton() {
        print("Any")
    }
}
