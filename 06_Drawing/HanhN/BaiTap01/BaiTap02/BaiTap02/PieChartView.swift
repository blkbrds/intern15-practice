
import UIKit
protocol PieChartViewDelegate: class {
    func pieChartView(_ piechartView: PieChartView, didSect index: Int)
}
struct Segment {
    var color: UIColor

    var value: CGFloat
}

class PieChartView: UIView {

    var segments = [Segment]() {
        didSet {
            setNeedsDisplay()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        isOpaque = false //  ghi đè drawRect
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        // get current context
        let context = UIGraphicsGetCurrentContext()
        //bán kính là một nửa chiều rộng hoặc chiều cao khung
        let radius = min(frame.size.width, frame.size.height) * 0.5
        //center of the view
        let viewCenter = CGPoint(x: bounds.size.width * 0.5, y: bounds.size.height * 0.5)
        let valueCount = segments.reduce(0, { $0 + $1.value })
        var startAngle = -CGFloat.pi * 0.5

        for segment in segments { // loop through the values array
            // set fill color to the segment color
            context?.setFillColor(segment.color.cgColor)
            // update the end angle of the segment
            let endAngle = startAngle + 2 * .pi * (segment.value / valueCount)
            context?.move(to: viewCenter)
            context?.addArc(center: viewCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            context?.fillPath()
            startAngle = endAngle
        }
    }

}
