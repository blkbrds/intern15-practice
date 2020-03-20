import UIKit

final class MyChart: UIView {
    // MARK: - Declare Variable
    var values: [CGFloat]?
    
    // MARK: - Override
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }
    
    override func draw(_ rect: CGRect) {
        drawTheChartFrame()
        drawChart()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function
    private func drawTheChartFrame() {
        drawLine(start: CGPoint(x: 30, y: self.bounds.size.height), end: CGPoint(x: self.bounds.size.width, y: self.bounds.size.height), color: .black)
        drawLine(start: CGPoint(x: 30, y: 30), end: CGPoint(x: 30, y: self.bounds.size.height), color: .black)
        drawLine(start: CGPoint(x: self.frame.maxX, y: self.frame.minY + 30), end: CGPoint(x: self.frame.maxX, y: self.frame.maxY), color: .brown)
        var temp2: Int = 0
        var index = self.bounds.size.height - 20
        for _ in 0...2 {
            let label = UILabel(frame: CGRect(x:0, y: index, width: 30, height: 20))
            label.text = "\(temp2)"
            self.addSubview(label)
            temp2 += 50
            index -= (self.bounds.size.height - 40) / 2
        }
    }
    
    private func drawChart() {
        var start: CGPoint = CGPoint(x: 30, y: self.bounds.size.height)
        var end: CGPoint = CGPoint()
        var temp: CGFloat = 80
        for item in values! {
            if temp < self.frame.size.width {
                end = CGPoint(x: temp, y: self.bounds.size.height - ((self.bounds.size.height - 30) * item / 100))
                drawLine(start: start, end: end , color: .blue)
                let label = UILabel(frame: CGRect(x: temp - 5, y: self.bounds.size.height - ((self.bounds.size.height - 30) * item / 100) - 20, width: 40, height: 20))
                label.text = "\(Int(item))"
                label.textColor = .red
                self.addSubview(label)
                start = end
                temp += 50
            }
        }
    }
    
    private func drawLine(start: CGPoint, end: CGPoint, color: UIColor) {
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        path.close()
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = 2.0
        shapeLayer.path = path.cgPath
        self.layer.addSublayer(shapeLayer)
    }
}
