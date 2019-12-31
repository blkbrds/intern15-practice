import UIKit

final class CustomSliderViewController: UIViewController {

	@IBOutlet private weak var verticalSlider: UISlider! {
		didSet {
			verticalSlider.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi / 2))
		}
	}
	
	@IBOutlet private var valueSlider: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
		changeAvatarSlider()
		changeValueSlider()
	}
	
	@IBAction private func changeValueSlider () {
		valueSlider.text = "\(Int(verticalSlider.value))%"
	}
	
	func changeAvatarSlider() {
		let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
		verticalSlider.setThumbImage(thumbImageNormal, for: .normal)
		let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
		verticalSlider.setThumbImage(thumbImageHighlighted, for: .highlighted)
		let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
		let trackLeftImage = UIImage(named: "SliderTrackLeft")!
		let trackLeftResizable =
			trackLeftImage.resizableImage(withCapInsets: insets)
		verticalSlider.setMinimumTrackImage(trackLeftResizable, for: .normal)
		let trackRightImage = UIImage(named: "SliderTrackRight")!
		let trackRightResizable =
			trackRightImage.resizableImage(withCapInsets: insets)
		verticalSlider.setMaximumTrackImage(trackRightResizable, for: .normal)
	}
}
