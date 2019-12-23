import UIKit

protocol DatePickerViewDelegate: class {
    func datePickViewDidChoose()
    func showWithAnimation()
}

class DatePickerView: UIView {
    
    weak var delegate: DatePickerViewDelegate?
    @IBOutlet weak var datePickerView: UIDatePicker!
    
    @IBAction func buttonDidClick(_ sender: Any) {
        delegate?.datePickViewDidChoose()
        hideWithAnimation()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        datePickerView.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        addSubview(datePickerView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func hideWithAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.datePickerView.alpha = 0
        }) { (done) in
            if done {
                self.datePickerView.isHidden = true
            }
        }
    }
    
}
