import UIKit

final class ColorViewController: UIViewController {

	@IBOutlet private weak var redSlider: UISlider!
	@IBOutlet private weak var blueSlider: UISlider!
	@IBOutlet private weak var greenSlider: UISlider!

	@IBOutlet private weak var colorView: UIView!
	@IBOutlet private weak var inforColorLabel: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
		sliderValueChanged()
	}

	@IBAction private func sliderValueChanged() {
		let valueRed = CGFloat(redSlider.value)
		let valueBlue = CGFloat(blueSlider.value)
		let valueGreen = CGFloat(greenSlider.value)

		inforColorLabel.text = "Color: Red :\(Int(valueRed)) , Blue : \(Int(valueBlue)) , Green : \(Int(valueGreen))"
		colorView.backgroundColor = UIColor(displayP3Red: valueRed / 255, green: valueGreen / 255, blue: valueBlue / 255, alpha: 1)
	}
}
