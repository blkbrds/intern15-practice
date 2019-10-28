
import UIKit

protocol ChartViewDelegate: class {
    func chartView(_ chartView: ChartView, didSectIndex : Int )
}
final class ChartView: UIView {
    var chartColor: UIColor = .green {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let context2 = UIGraphicsGetCurrentContext()
        context?.setLineWidth(2)
        context?.move(to: CGPoint(x: 0, y: 100 ))
        context?.addLine(to: CGPoint(x: 50, y: 20))
        context?.addLine(to: CGPoint(x: 100, y: 60))
        context?.addLine(to: CGPoint(x: 130, y: 70))
        context?.addLine(to: CGPoint(x: 150, y: 60))
        context?.addLine(to: CGPoint(x: 200 , y: 80))
        context?.addLine(to: CGPoint(x: 230, y: 30))
        context?.addLine(to: CGPoint(x: 280, y: 80))
        context?.addLine(to: CGPoint(x: 340, y: 20))
        context?.addLine(to: CGPoint(x: 370, y: 50))
        context?.addLine(to: CGPoint(x: 400, y: 100))
        context?.addLine(to: CGPoint(x: 0, y: 100))
        context?.setFillColor(UIColor.red.cgColor)
        context?.fillPath()
        
         context2?.addArc(center: CGPoint(x: 50, y: 20), radius: 5, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
               context2?.setFillColor(UIColor.blue.cgColor)
               context2?.fillPath()
        let context3 = UIGraphicsGetCurrentContext()
        context3?.addArc(center: CGPoint(x: 100, y: 60), radius: 5, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        context3?.setFillColor(UIColor.blue.cgColor)
        context3?.fillPath()
        let context4 = UIGraphicsGetCurrentContext()
        context4?.addArc(center: CGPoint(x: 130, y: 70), radius: 5, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        context4?.setFillColor(UIColor.blue.cgColor)
        context4?.fillPath()
        let context5 = UIGraphicsGetCurrentContext()
        context5?.addArc(center: CGPoint(x: 150, y: 60), radius: 5, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        context5?.setFillColor(UIColor.blue.cgColor)
        context5?.fillPath()
        let context6 = UIGraphicsGetCurrentContext()
        context6?.addArc(center: CGPoint(x: 200 , y: 80), radius: 5, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        context6?.setFillColor(UIColor.blue.cgColor)
        context6?.fillPath()
        let context7 = UIGraphicsGetCurrentContext()
        context7?.addArc(center: CGPoint(x: 230, y: 30), radius: 5, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        context7?.setFillColor(UIColor.blue.cgColor)
        context7?.fillPath()
        let context8 = UIGraphicsGetCurrentContext()
        context8?.addArc(center: CGPoint(x: 340, y: 20), radius: 5, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        context8?.setFillColor(UIColor.blue.cgColor)
        context8?.fillPath()
        let context9 = UIGraphicsGetCurrentContext()
        context9?.addArc(center: CGPoint(x: 370, y: 50), radius: 5, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        context9?.setFillColor(UIColor.blue.cgColor)
        context9?.fillPath()
        let context10 = UIGraphicsGetCurrentContext()
        context10?.addArc(center: CGPoint(x: 400, y: 100), radius: 5, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        context10?.setFillColor(UIColor.blue.cgColor)
        context10?.fillPath()
        let context11 = UIGraphicsGetCurrentContext()
        context11?.addArc(center: CGPoint(x: 0, y: 100), radius: 5, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        context11?.setFillColor(UIColor.blue.cgColor)
        context11?.fillPath()
        let context12 = UIGraphicsGetCurrentContext()
        context12?.addArc(center: CGPoint(x: 280, y: 80), radius: 5, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        context12?.setFillColor(UIColor.blue.cgColor)
        context12?.fillPath()
    }
}
