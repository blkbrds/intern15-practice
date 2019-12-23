import UIKit

final class HomeViewController: UIViewController {
    
    var myDatePickerView: DatePickerView? = nil
    
    @IBOutlet var textField: UITextField!
    
    
    @IBAction func textFieldDidTouch(_ sender: Any) {
        showWithAnimation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myDatePickerView = Bundle.main.loadNibNamed("DatePickerView", owner: self, options: nil)![0] as? DatePickerView
        myDatePickerView!.delegate = self as DatePickerViewDelegate
        myDatePickerView!.frame = CGRect(x: 0, y: 400, width: 400, height: 100)
        view.addSubview(myDatePickerView!)
        textField = UITextField(frame: CGRect(x: 100, y: 50, width: 100, height: 30))
        view.addSubview(textField)
    }
    
    func showWithAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.myDatePickerView!.datePickerView.alpha = 1
        }) { (done) in
            if done {
                self.myDatePickerView!.datePickerView.isHidden = false
            }
        }
        view.endEditing(false)
    }
}

extension HomeViewController: DatePickerViewDelegate {
    func datePickViewDidChoose() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        let strDate = dateFormatter.string(from: (myDatePickerView?.datePickerView.date)!)
        textField.text = strDate
    }
}

