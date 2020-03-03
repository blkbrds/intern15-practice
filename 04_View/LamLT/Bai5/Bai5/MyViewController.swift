import UIKit

class MyViewController: UIViewController {

    @IBOutlet weak var lineSlider: UISlider!
    @IBOutlet weak var labelValue: UILabel!

    func DEGTORAD(deg: Double) -> CGFloat
    {
        return CGFloat(deg * M_PI / 180.0)
    }

    func trackRect(forBounds bounds: CGRect) -> CGRect {
        var newBounds = trackRect(forBounds: bounds)
        newBounds.size.height = 12
        return newBounds
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        lineSlider.layer.setAffineTransform(CGAffineTransform(rotationAngle: DEGTORAD(deg: 90)))
//        lineSlider.trackRect(forBounds: CGRect(x: 0, y: 0, width: 100, height: 100))
        lineSlider.thumbTintColor = .orange

    }

    @IBAction func sliderChangedValue(_ sender: UISlider) {
        labelValue.text = "\(lineSlider.value * 100)"
    }
}
