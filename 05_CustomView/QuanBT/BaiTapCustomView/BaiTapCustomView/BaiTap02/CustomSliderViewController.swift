import UIKit

final class CustomSliderViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var valueTextField: UITextField!
    
    // MARK: - Declare Variable
    private var value: Int = 100 {
        didSet {
            valueTextField.text = String(value)
        }
    }
    
    //MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect(x: 170, y: 300, width: 80, height: 400)
        let mySlider = MySliderView(frame: frame)
        view.addSubview(mySlider)
        valueTextField.delegate = self
        mySlider.delegate = self
        valueTextField.text = String(value)
    }
}

// MARK: - Extension
extension CustomSliderViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension CustomSliderViewController: SliderViewDelegate {
    func changeValue(value: CGFloat) {
        self.value = Int(value)
    }
}
