import UIKit

class MyViewController: UIViewController {

    @IBOutlet private weak var lineSlider: UISlider!
    @IBOutlet private weak var numberValueLabel: UILabel!

    func degtorad(deg: Double) -> CGFloat {
        return CGFloat(deg * M_PI / 180.0)
    }

    func trackRect(forBounds bounds: CGRect) -> CGRect {
        var newBounds = trackRect(forBounds: bounds)
        newBounds.size.height = 12
        return newBounds
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        lineSlider.layer.setAffineTransform(CGAffineTransform(rotationAngle: degtorad(deg: -90)))
        lineSlider.thumbTintColor = .orange
    }

    @IBAction func sliderChangedValue(_ sender: UISlider) {
        numberValueLabel.text = "\(Int(lineSlider.value * 100))"
    }
}
