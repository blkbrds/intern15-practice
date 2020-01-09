import UIKit

class ChartViewController: UIViewController {

	override func viewDidLoad() {
		let xStartPoint: CGFloat = 50
		var yStartPoint: CGFloat = 50
		let xEndPoint: CGFloat = 850
		var yEndPoint: CGFloat = 50
		var yPoint: CGFloat = 60
		var xPoint: CGFloat = 50
		var heightColurm: CGFloat = 290
		let valueColurm : CGFloat = 30
		let spacingY : CGFloat = 150
		let spacingX : CGFloat = 150
		
		for _ in 0..<4 {
			_ = drawLine(start: CGPoint(x: xStartPoint, y: yStartPoint), end: CGPoint(x: xEndPoint, y: yEndPoint))
			yStartPoint += spacingY
			yEndPoint += spacingY
		}
		
		for _ in 0..<7 {
			let rectView = FxRectangularView(frame: CGRect(x: xPoint, y: yPoint, width: 35, height: heightColurm))
			xPoint += spacingX
			yPoint += valueColurm
			heightColurm -= valueColurm
			rectView.backgroundColor = .red
			view.addSubview(rectView)
		}

		let arrayColurmXName: [String] = ["1000", "500", "300", "100"]
		let arrayColurmYName: [String] = ["Tus", "Wed", "Thus", "Fri", "Sat", "Sun", "Fri"]
		var ySpacing = 30
		var xSpacing = 50
		for i in 0..<4 {
			let XColurmLabel: UILabel = UILabel(frame: CGRect(x: 10, y: ySpacing, width: 50, height: 30))
			XColurmLabel.text = String(arrayColurmXName[i])
			ySpacing += 100
			view.addSubview(XColurmLabel)
		}

		for i in 0..<7 {
			let YColurmLabel: UILabel = UILabel(frame: CGRect(x: xSpacing, y: 350, width: 80, height: 50))
			YColurmLabel.text = String(arrayColurmYName[i])
			xSpacing += 150
			view.addSubview(YColurmLabel)
		}
	}

	func drawLine(start: CGPoint, end: CGPoint) {
		let path = UIBezierPath()
		path.move(to: start)
		path.addLine(to: end)
		path.close()
		let shapeLayer = CAShapeLayer()
		shapeLayer.strokeColor = UIColor.blue.cgColor
		shapeLayer.lineWidth = 1.0
		shapeLayer.path = path.cgPath
		self.view.layer.addSublayer(shapeLayer)
	}
}
