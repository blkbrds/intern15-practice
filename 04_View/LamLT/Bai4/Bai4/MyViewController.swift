import UIKit

class MyViewController: UIViewController {

    @IBOutlet weak var valueTextLabel: UILabel!
    @IBOutlet weak var redValueSlider: UISlider!
    @IBOutlet weak var blueValueSlider: UISlider!
    @IBOutlet weak var greenValueSlider: UISlider!
    @IBOutlet weak var valueGreen: UILabel!
    @IBOutlet weak var changeValueTextLabel: UILabel!
    @IBOutlet weak var changeColorView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        changeColorView.backgroundColor = UIColor(red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0)
        redValueSlider.addTarget(self, action: #selector(changeValueSlider), for: .valueChanged)
        blueValueSlider.addTarget(self, action: #selector(changeValueSlider), for: .valueChanged)
        greenValueSlider.addTarget(self, action: #selector(changeValueSlider), for: .valueChanged)
    }

    @objc func changeValueSlider(_ x: UISlider, _ y: UISlider, _ z: UISlider) {
        let a = redValueSlider.value
        let b = greenValueSlider.value
        let c = blueValueSlider.value
        changeColorView.backgroundColor = UIColor(red: CGFloat(a), green: CGFloat(b), blue: CGFloat(c), alpha: 1.0)
        valueTextLabel.text = "Color (R: \(round(a * 255)),G: \(round(b * 255)),B: \(round(c * 255))"
    }
}
