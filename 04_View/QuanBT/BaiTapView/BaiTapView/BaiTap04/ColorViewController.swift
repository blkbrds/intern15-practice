import UIKit

final class ColorViewController: UIViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var colorView: UIView!
    @IBOutlet private weak var redSlider: UISlider!
    @IBOutlet private weak var greenSlider: UISlider!
    @IBOutlet private weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 40
        colorView.clipsToBounds = true
    }

    @IBAction private func changeColor(_ sender: Any) {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: 1)
        titleLabel.text = "Color(R: \(Int(redSlider.value)), G: \(Int(greenSlider.value)), B: \(Int(blueSlider.value)))"
    }
}
