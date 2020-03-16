import UIKit

class PieChartView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }

    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
    }

    override func draw(_ rect: CGRect) {
        createPath(radiusCircle: 150, start: 0, end: .pi / 4, lineClock: true, colorPie: .red)
        createPath(radiusCircle: 180, start: 0, end: (-1 / 2) * .pi, lineClock: false, colorPie: .green)
        createPath(radiusCircle: 100, start: .pi / 4, end: .pi, lineClock: true, colorPie: .blue)
        createPath(radiusCircle: 160, start: .pi, end: 3 / 2 * .pi, lineClock: true, colorPie: .darkGray)
    }

    func createPath(radiusCircle: CGFloat, start: CGFloat, end: CGFloat, lineClock: Bool, colorPie: UIColor) {
        let path = UIBezierPath()
        path.move(to: center)
        path.addArc(withCenter: center, radius: radiusCircle, startAngle: start, endAngle: end, clockwise: lineClock)
        path.close()
        colorPie.setFill()
        path.fill()

    }

}
