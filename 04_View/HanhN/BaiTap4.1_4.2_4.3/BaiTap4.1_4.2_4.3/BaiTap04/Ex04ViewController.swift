
import UIKit

final class Ex04ViewController: UIViewController {

    struct Color {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var color: UIColor {
            return UIColor(displayP3Red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
        }
    }
    
    @IBOutlet weak var ViewMau: UIView!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var SilerView03: UISlider!
    @IBOutlet weak var SilerView02: UISlider!
    @IBOutlet weak var SilerView01: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewMau.layer.cornerRadius = 20
        colorLabel.text = "Clor (R: 128,G: 128,B: 128 )"
    }
    var color = Color()
    @IBAction func redSiler(_ sender: Any) {
        color.red = CGFloat(SilerView01.value)
        ViewMau.backgroundColor = color.color
        print("\(color)")
        colorLabel.text = "Color ( R : \(Int(color.red)) , G : \(Int(color.green)) , B :\(Int(color.blue)) )"
    }

    @IBAction func geenSiler(_ sender: Any) {
        color.green = CGFloat(SilerView02.value)
        ViewMau.backgroundColor = color.color
        colorLabel.text = "Color ( R : \(Int(color.red)) , G : \(Int(color.green)) , B :\(Int(color.blue)) )"

    }

    @IBAction func blueSiler(_ sender: Any) {
        color.blue = CGFloat(SilerView03.value)
        ViewMau.backgroundColor = color.color
        colorLabel.text = "Color ( R : \(Int(color.red)) , G : \(Int(color.green)) , B :\(Int(color.blue)) )"

    }
}
