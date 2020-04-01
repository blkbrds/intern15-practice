import UIKit

protocol DatePickerViewDelegate {
    func chonNgayThangNam(date: Date?)
}

class DatePickerView: UIView {
  
    
    @IBOutlet weak var viewHienThi: UIView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    var delegate: DatePickerViewDelegate?
    var datePicker1: UIDatePicker?
    
    
    
    func hideDatePickker() {
        datePicker.alpha = 1
        isHidden = true
    }
    
    func showDatePick() {
        self.isHidden = false
              UIView.animate(withDuration: 0.5, animations: {
                self.viewHienThi.alpha = 1
              })
    }
    
    @IBAction func done(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations:  {
            self.viewHienThi.alpha = 0
        }) { (done) in self.isHidden = true }
        guard let delegate = delegate else {
            return
        }
        delegate.chonNgayThangNam(date: datePicker.date)
    }
}
