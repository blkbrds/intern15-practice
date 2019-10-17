
import UIKit

class Ex2ViewController: UIViewController {

    @IBOutlet weak var valueTextfield: UITextField!
    var fxSliderView: FxSliderView!

    override func viewDidLoad() {
        super.viewDidLoad()
//        let sliderView = Bundle.main.loadNibNamed("SliderView", owner: self, options: nil)?[0] as? SliderView
//        sliderView?.frame = CGRect(x: 150, y: 200, width: 50, height: 200)
//        view.addSubview(sliderView!)
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
        valueTextfield.text = "\(percent)"
    }
}


