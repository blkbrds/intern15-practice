import UIKit

final class MonkeyViewController: UIViewController {

	@IBOutlet private weak var monkeyView: UIImageView!
	@IBOutlet private weak var messageMonkeyLabel: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
		setUpView()
		messageMonkeyLabel.isHidden = true
	}

	func setUpView () {
		let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(recognizer:)))
		let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
		let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation(recognizer:)))
		let longpressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressGesture(recognizer:)))
		longpressGesture.minimumPressDuration = 1.0
		let oneTapGesture = UITapGestureRecognizer(target: self, action: #selector(oneTapGesture(recognizer:)))
		let twoTapGesture = UITapGestureRecognizer(target: self, action: #selector(twoTapGesture(recognizer:)))

		monkeyView.addGestureRecognizer(pinchGesture)
		monkeyView.addGestureRecognizer(panGesture)
		monkeyView.addGestureRecognizer(rotationGesture)
		monkeyView.addGestureRecognizer(longpressGesture)
		monkeyView.addGestureRecognizer(oneTapGesture)
		monkeyView.addGestureRecognizer(twoTapGesture)
	}

	@IBAction private func handlePan(recognizer: UIPanGestureRecognizer) {
		let translation = recognizer.translation(in: self.view)
		if let view = recognizer.view {
			view.center = CGPoint(x: view.center.x + translation.x,
				y: view.center.y + translation.y)
		}
		recognizer.setTranslation(CGPoint.zero, in: self.view)
	}

	@IBAction private func handlePinch(recognizer: UIPinchGestureRecognizer) {
		guard let view = recognizer.view, recognizer.scale <= 2 && recognizer.scale >= 0.5 else { return }
		view.transform = view.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
		recognizer.scale = 1
	}

	@IBAction private func handleRotation(recognizer: UIRotationGestureRecognizer) {
		if let view = recognizer.view {
			view.transform = view.transform.rotated(by: recognizer.rotation)
			recognizer.rotation = 0
		}
	}

	@IBAction private func longPressGesture(recognizer: UILongPressGestureRecognizer) {
		if let view = recognizer.view {
			UIView.animate(withDuration: 1.0) {
				view.transform = view.transform.scaledBy(x: 1.0, y: 1.0)
				view.transform = CGAffineTransform(translationX: 0, y: 0)
			}
		}
	}

	@IBAction private func oneTapGesture (recognizer: UITapGestureRecognizer) {
		if recognizer.view != nil {
			messageMonkeyLabel.isHidden = false
			messageMonkeyLabel.alpha = 1
			messageMonkeyLabel.text = "Tôi là khỉ"
			Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
				UIView.animate(withDuration: 0) {
					self.messageMonkeyLabel.alpha = 1
				}
			}
		}
	}

	@IBAction private func twoTapGesture (recognizer: UITapGestureRecognizer) {
		if recognizer.view != nil {
			messageMonkeyLabel.isHidden = false
			messageMonkeyLabel.alpha = 1
			messageMonkeyLabel.text = "Khi la toi"
			Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
				UIView.animate(withDuration: 0) {
					self.messageMonkeyLabel.alpha = 0
				}
			}
		}
	}
}
