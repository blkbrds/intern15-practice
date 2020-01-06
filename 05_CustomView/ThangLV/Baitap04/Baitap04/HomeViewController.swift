import UIKit

final class HomeViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    var myDatePickerView: DatePickerView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNib()
        textField = UITextField(frame: CGRect(x: 100, y: 50, width: 100, height: 30))
        view.addSubview(textField)
    }
    
    func loadNib() {
        guard let nib =  Bundle.main.loadNibNamed("DatePickerView", owner: self, options: nil) else  { return }
        guard let myPickerView = nib[0] as? DatePickerView  else { return }
        myDatePickerView = myPickerView
        myDatePickerView?.delegate = self
        myDatePickerView?.frame = CGRect(x: 0, y: 400, width: 400, height: 100)
        view.addSubview(myDatePickerView!)
    }
    
    func showWithAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.myDatePickerView?.datePicker.alpha = 1
        }) { (done) in
            if done {
                self.myDatePickerView?.datePicker.isHidden = false
            }
        }
        view.endEditing(false)
    }
    
    @IBAction func tapOnTextField(_ sender: Any) {
        showWithAnimation()
    }
}

extension HomeViewController: DatePickerViewDelegate {
    func datePickViewDidChoose() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        let strDate = dateFormatter.string(from: (myDatePickerView?.datePicker.date)!)
        textField.text = strDate
    }
}

