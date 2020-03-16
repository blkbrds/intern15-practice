import UIKit

class ColorViewController: UIViewController {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var viewColor: UIView!
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewColor.layer.cornerRadius = 40
        viewColor.clipsToBounds = true
    }

    @IBAction func actionRed(_ sender: Any) {
        viewColor.backgroundColor = UIColor(red: CGFloat(sliderRed.value)/255, green: CGFloat(sliderGreen.value)/255, blue: CGFloat(sliderBlue.value)/255, alpha: 1)
        labelTitle.text = "Color(R: \(Int(sliderRed.value)), G: \(Int(sliderGreen.value)), B: \(Int(sliderBlue.value)))"
    }
}
