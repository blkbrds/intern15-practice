import UIKit

final class MyPieChart: UIView {
    // MARK: - Declare Variable
    var values: [CGFloat] = []
    private var startAngle: CGFloat = CGFloat(0.0) * CGFloat.pi / 180
    private var endAngle: CGFloat = CGFloat(180.0) * CGFloat.pi / 180
    
    // MARK: - Override
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        for index in  0 ..< values.count {
            endAngle = endAngle + CGFloat(values[index] / sumValues() * 360) * CGFloat.pi / 180
            drawChart(withCenter: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2), radius: self.frame.size.height/2, startAngle: startAngle, endAngle: endAngle, clockwise: true, color: UIColor(red: CGFloat.random(in: 0...255) / 255, green: CGFloat.random(in: 0...255) / 255, blue: CGFloat.random(in: 0...255) / 255, alpha: 1.0))
            startAngle = endAngle
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function
    private func sumValues() -> CGFloat {
        var sum: CGFloat = 0
        for item in values {
            sum += item
        }
        return sum
    }
    
    private func drawChart(withCenter: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, clockwise: Bool, color: UIColor) {
        let path = UIBezierPath()
        path.move(to: withCenter)
        path.addArc(withCenter: withCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = color.cgColor
        shapeLayer.path = path.cgPath
        layer.addSublayer(shapeLayer)
    }
}
