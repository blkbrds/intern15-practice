import UIKit

final class ColorViewController: UIViewController {

	@IBOutlet private weak var sliderRed: UISlider!
	@IBOutlet private weak var sliderBlue: UISlider!
	@IBOutlet private weak var sliderGreen: UISlider!
	@IBOutlet private weak var valueCurrentRed: UILabel!
	@IBOutlet private weak var valueCurrentGreen: UILabel!
	@IBOutlet private weak var valueCurrentBlue: UILabel!
	@IBOutlet private weak var ColorView: UIView!
	@IBOutlet private weak var inforColor: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
		sliderValueChanged()
	}

	@IBAction private func sliderValueChanged() {
		let valueRed = CGFloat(sliderRed.value)
		let valueBlue = CGFloat(sliderBlue.value)
		let valueGreen = CGFloat(sliderGreen.value)

		inforColor.text = "Color: Red :\(Int(valueRed)) , Blue : \(Int(valueBlue)) , Green : \(Int(valueGreen))"
		ColorView.backgroundColor = UIColor(displayP3Red: valueRed / 255, green: valueGreen / 255, blue: valueBlue / 255, alpha: 1)
	}
}
