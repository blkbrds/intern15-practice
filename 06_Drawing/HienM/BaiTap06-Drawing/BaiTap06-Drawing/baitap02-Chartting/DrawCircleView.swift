import SwiftUI

class DrawCircleView: UIView {
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = .clear
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	let colors: [UIColor] = [.red, .blue, .cyan, .black, .brown, .darkGray]

	override func draw(_ rect: CGRect) {
		super.draw(rect)
		var startAngle: CGFloat = CGFloat(0.0) * CGFloat.pi / 180
		var closeAngle: CGFloat = (CGFloat(60.0) * CGFloat.pi / 180)
		let increasePart: CGFloat = CGFloat(60.0) * CGFloat.pi / 180
		let centerView: CGPoint = CGPoint(x: bounds.width / 2, y: bounds.height / 2)

		for i in 0..<colors.count {
			createBezierPath(arcCenter: centerView, radius: self.frame.size.height / 2 - 30, startAngle: startAngle, endAngle: closeAngle, clockwise: true, color: colors[i])

			startAngle = closeAngle
			closeAngle = closeAngle + increasePart
		}

		let centerCircleView: UIView = UIView()
		centerCircleView.frame.size = CGSize(width: frame.size.height / 2 + 30, height: frame.size.height / 2 + 30)
		centerCircleView.layer.cornerRadius = centerCircleView.frame.size.width / 2
		centerCircleView.backgroundColor = .orange
		centerCircleView.center = centerView
		addSubview(centerCircleView)
	}
	func createBezierPath (arcCenter: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, clockwise: Bool, color: UIColor) {
		let path = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
		path.move(to: arcCenter)
		let fillColor: UIColor = color
		fillColor.setStroke()
		path.lineWidth = 60
		path.stroke()
		path.close()
	}
}

