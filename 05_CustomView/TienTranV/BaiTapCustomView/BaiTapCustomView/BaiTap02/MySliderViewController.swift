import UIKit

final class MySliderViewController: UIViewController {

    @IBOutlet private weak var valueTextField: UITextField!
    @IBOutlet private weak var mySliderView: MySliderView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        mySliderView.delegate = self
        mySliderView.datasource = self
        valueTextField.delegate = self
    }
}

extension MySliderViewController: MySliderViewDelegate {
    func mySlider(mySlider: MySliderView, needPerformAction action: MySliderView.Action) {
        switch action {
        case .getPercent(let value):
            valueTextField.text = "\(value)"
        }
    }
}

extension MySliderViewController: MySliderViewDatasource {
    func getValue(mySlider: MySliderView) -> Int {
        guard let text = valueTextField.text, let getValue = Int(text) else { return 0 }
        return getValue
    }
}

extension MySliderViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let value = valueTextField.text, let valueInt = Int(value) {
            if valueInt > 100 || valueInt < 0 {
                return false
            } else {
                mySliderView.updateUI()
                return true
            }
        }
        return false
    }
}
