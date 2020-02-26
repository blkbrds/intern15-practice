import UIKit

final class ChartCircleViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		drawCircleView()
	}

	private func drawCircleView() {
		let circleView = DrawCircleView(frame: CGRect(x: 50.0, y: 400.0, width: 300, height: 300))
		view.addSubview(circleView)
	}
}
