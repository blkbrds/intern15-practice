import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var showValueLabel: UILabel!
    @IBOutlet weak var redValue: UILabel!
    @IBOutlet weak var greenValue: UILabel!
    @IBOutlet weak var blueValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.backgroundColor = UIColor(red: .random(in: 0...1),
                                            green: .random(in: 0...1),
                                            blue: .random(in: 0...1),
                                            alpha: 1.0)
        redSlider.addTarget(self, action: #selector(thayDoiMau), for: .valueChanged)
        greenSlider.addTarget(self, action: #selector(thayDoiMau), for: .valueChanged)
        blueSlider.addTarget(self, action: #selector(thayDoiMau), for: .valueChanged)
    }
    
    
    @objc func thayDoiMau(_ sender: UISlider) {
        let red = redSlider.value
        let green = greenSlider.value
        let blue = blueSlider.value
        colorView.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
        showValueLabel.text = "Color(R: \(round(red * 225)),G: \(round(green * 225)),B: \(round(blue * 225)))"
        redValue.text = "\(round(red * 225))"
        greenValue.text = "\(round(green * 225))"
        blueValue.text = "\(round(blue * 225))"
    }
}


