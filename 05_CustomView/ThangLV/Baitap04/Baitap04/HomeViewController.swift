import UIKit

class HomeViewController: UIViewController {
    
    var datePicker: DatePickerView? = nil
    var textField: TextField? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker?.delegate = self as? DatePickerViewDelegate
        setUpUI()
    }
    
    func setUpUI() {
        textField = Bundle.main.loadNibNamed("TextField", owner: self, options: nil)?[0] as? TextField
        datePicker?.frame = CGRect(x: 100, y: 50, width: 70, height: 20)
        view.addSubview(textField!)
        datePicker = Bundle.main.loadNibNamed("DatePickerView", owner: self, options: nil)?[0] as? DatePickerView
        datePicker?.frame = CGRect(x: 0, y: 300, width: self.view.frame.size.width, height: 300)
        view.addSubview(datePicker!)
    }
}
