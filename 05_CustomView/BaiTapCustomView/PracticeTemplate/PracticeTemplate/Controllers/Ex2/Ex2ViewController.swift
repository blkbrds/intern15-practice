
import UIKit

class Ex2ViewController: UIViewController {

    @IBOutlet weak var valueTextfield: UITextField!
    var fxSliderView: FxSliderView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fxSliderView = Bundle.main.loadNibNamed("FxSliderView", owner: self, options: nil)?.first as? FxSliderView
        fxSliderView.frame = CGRect(x: 150, y: 150, width: 80, height: 400)
        fxSliderView.delegate = self
        view.addSubview(fxSliderView)
        fxSliderView.setValue(percent: 80)
    }

}

extension Ex2ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let percent = Int(textField.text!)
        fxSliderView.setValue(percent: Float(percent!))

        return true
    }
}

extension Ex2ViewController: FxSliderViewDelegate {
    func fxSliderView(view: FxSliderView, didChangedWith percent: Float) {
        valueTextfield.text = String(percent)
    }
}


