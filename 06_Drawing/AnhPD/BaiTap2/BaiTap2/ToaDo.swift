import UIKit

class ToaDo: UIView {
    var values: [CGFloat]?
    var startAngle: CGFloat = CGFloat(0.0) * CGFloat.pi / 180
    var endAngle: CGFloat = CGFloat(180.0) * CGFloat.pi / 180
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        if let values = values  {
            for i in 0..<values.count {
                endAngle = endAngle + CGFloat(values[i] / sumValues() * 360) * CGFloat.pi / 180
                drawChart(withCenter: CGPoint(x: self.frame.width/2, y: self.frame.size.height/2), radius: self.frame.size.height/2, startAngle: startAngle, endAngle: endAngle, colorwise: true, color: UIColor(red: CGFloat.random(in: 0...255)/255, green: CGFloat.random(in: 0...225)/255, blue: CGFloat.random(in: 0...225)/255, alpha: 1.0))
                startAngle = endAngle
            }
        }
    }
    
    func sumValues() -> CGFloat {
        var sum: CGFloat = 0
        if let values = values {
            for item in values {
                sum += item
            }
        }
        return sum
    }
    
    func drawChart(withCenter: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, colorwise: Bool, color: UIColor) {
        let path = UIBezierPath()
        path.move(to: withCenter)
        path.addArc(withCenter: withCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: colorwise)
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = color.cgColor
        shapeLayer.path = path.cgPath
        
        layer.addSublayer(shapeLayer)
    }
}
