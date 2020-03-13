import UIKit

class ChartViewController: UIViewController {
    var ballColor: UIColor = .green
    override func viewDidLoad() {
        super.viewDidLoad()
        drawLine(start: CGPoint(x: 50, y: 100), end: CGPoint(x: 50, y: 500))
        drawLine(start: CGPoint(x: 50, y: 500), end: CGPoint(x: 500, y: 500))
        
        drawChart(start: CGPoint(x: 50, y: 440), end: CGPoint(x: 100, y: 400))
        drawChart(start: CGPoint(x: 100, y: 400), end: CGPoint(x: 150, y: 320))
        drawChart(start: CGPoint(x: 150, y: 320), end: CGPoint(x: 200, y: 270))
        drawChart(start: CGPoint(x: 200, y: 270), end: CGPoint(x: 250, y: 300))
        drawChart(start: CGPoint(x: 250, y: 300), end: CGPoint(x: 300, y: 264))
        drawChart(start: CGPoint(x: 300, y: 264), end: CGPoint(x: 350, y: 360))
        drawChart(start: CGPoint(x: 350, y: 360), end: CGPoint(x: 350, y: 500))

        createLabel(xPosition: 2, yPosition: 430, textLine: "999")
        createLabel(xPosition: 2, yPosition: 280, textLine: "1000")
        createLabel(xPosition: 2, yPosition: 150, textLine: "1001")
        
        drawCircle(radius: 9, xPosArr: [50,100,150,200,250,300,350], yPosArr: [440,400,320,270,300,264,360])
        
    }

    func drawLine(start: CGPoint, end: CGPoint) {
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        UIColor.yellow.setFill()
        path.close()
        path.fill()

        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 1.0
        shapeLayer.path = path.cgPath

        self.view.layer.addSublayer(shapeLayer)
    }

    func drawChart(start: CGPoint, end: CGPoint) {
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        path.close()

        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.green.cgColor
        shapeLayer.lineWidth = 1.0
        shapeLayer.path = path.cgPath
//        shapeLayer.isHidden = true
        self.view.layer.addSublayer(shapeLayer)
    }

    func drawCircle(radius: CGFloat,xPosArr: [CGFloat],yPosArr: [CGFloat]) {
        for i in 0..<xPosArr.count {
            let frame = CGRect(x: xPosArr[i], y: yPosArr[i], width: radius, height: radius)
            let circle = ChartView(frame: frame)
            circle.ballColor = .yellow
            self.view.addSubview(circle)
        }
    }
    
    func createLabel(xPosition: CGFloat, yPosition: CGFloat, textLine: String) {
        let label = UILabel()
        label.frame = CGRect(x: xPosition, y: yPosition, width: 50, height: 20)
        label.text = textLine
        self.view.addSubview(label)
    }
}
