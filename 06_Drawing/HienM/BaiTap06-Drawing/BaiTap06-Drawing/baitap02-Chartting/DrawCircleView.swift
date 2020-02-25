import SwiftUI

final class DrawCircleView: UIView {

	private var startAngle: CGFloat = CGFloat(0.0) * CGFloat.pi / 180
	private var closeAngle: CGFloat = (CGFloat(60.0) * CGFloat.pi / 180)
	private let increasePart: CGFloat = CGFloat(60.0) * CGFloat.pi / 180
	private let centerView: CGPoint = CGPoint(x: 150, y: 150)
	private let colors: [UIColor] = [.red, .blue, .cyan, .black, .brown, .darkGray]
	private let centerCircleView = UIView()

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupUI()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupUI() {
		createCenterCircle()
		self.backgroundColor = .clear
	}

	override func draw(_ rect: CGRect) {
		for i in 0..<colors.count {
			createBezierPath(arcCenter: centerView, radius: self.frame.size.height / 2 - 30, startAngle: startAngle, endAngle: closeAngle, clockwise: true, color: colors[i])
			startAngle = closeAngle
			closeAngle = closeAngle + increasePart
		}
	}

	private func createCenterCircle() {
		centerCircleView.frame.size = CGSize(width: frame.size.height / 2 + 10, height: frame.size.height / 2 + 10)
		centerCircleView.layer.cornerRadius = centerCircleView.frame.size.width / 2
		centerCircleView.backgroundColor = .orange
		centerCircleView.center = centerView
		addSubview(centerCircleView)
	}

	private func createBezierPath (arcCenter: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, clockwise: Bool, color: UIColor) {
		let path = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
		path.move(to: arcCenter)

		let fillColor: UIColor = color
		fillColor.setStroke()
		path.lineWidth = 60
		path.stroke()
		path.close()
	}
}

