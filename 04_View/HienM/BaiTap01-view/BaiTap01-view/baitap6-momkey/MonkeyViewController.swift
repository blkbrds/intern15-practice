import UIKit

final class MonkeyViewController: UIViewController {

	@IBOutlet private weak var monkeyImage: UIImageView!
	@IBOutlet private weak var messageMonkey: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
		setUpView()
		messageMonkey.isHidden = true
	}

	func setUpView () {
		let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(recognizer:)))
		let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
		let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation(recognizer:)))
		let longpressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressGesture(recognizer:)))
		longpressGesture.minimumPressDuration = 1.0
		let oneTapGesture = UITapGestureRecognizer(target: self, action: #selector(oneTapGesture(recognizer:)))
		let twoTapGesture = UITapGestureRecognizer(target: self, action: #selector(twoTapGesture(recognizer:)))

		monkeyImage.addGestureRecognizer(pinchGesture)
		monkeyImage.addGestureRecognizer(panGesture)
		monkeyImage.addGestureRecognizer(rotationGesture)
		monkeyImage.addGestureRecognizer(longpressGesture)
		monkeyImage.addGestureRecognizer(oneTapGesture)
		monkeyImage.addGestureRecognizer(twoTapGesture)
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
			messageMonkey.isHidden = false
			messageMonkey.alpha = 1
			messageMonkey.text = "Tôi là khỉ"
			Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
				UIView.animate(withDuration: 0) {
					self.messageMonkey.alpha = 1
				}
			}
		}
	}

	@IBAction private func twoTapGesture (recognizer: UITapGestureRecognizer) {
		if recognizer.view != nil {
			messageMonkey.isHidden = false
			messageMonkey.alpha = 1
			messageMonkey.text = "Khi la toi"
			Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
				UIView.animate(withDuration: 0) {
					self.messageMonkey.alpha = 0
				}
			}
		}
	}
}
