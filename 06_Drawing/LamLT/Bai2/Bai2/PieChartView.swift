

import UIKit

class PieChartView: UIView {

    var line: Bool = true
    var radiusCircle: CGFloat = 150
    var colorPie: UIColor = .red

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }

    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
    }

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: center)
        path.addArc(withCenter: center, radius: radiusCircle, startAngle: 0, endAngle: .pi / 4, clockwise: line)
        path.close()
        colorPie.setFill()
        path.fill()

        let path1 = UIBezierPath()
        path1.move(to: center)
        path1.addArc(withCenter: center, radius: radiusCircle + 30, startAngle: 0, endAngle: (-1 / 2) * .pi, clockwise: !line)
        path1.close()
        UIColor.green.setFill()
        path1.fill()

        let path2 = UIBezierPath()
        path2.move(to: center)
        path2.addArc(withCenter: center, radius: radiusCircle - 50, startAngle: .pi / 4, endAngle: .pi, clockwise: line)
        path2.close()
        UIColor.blue.setFill()
        path2.fill()

        let path3 = UIBezierPath()
        path3.move(to: center)
        path3.addArc(withCenter: center, radius: radiusCircle + 10, startAngle: .pi, endAngle: 3 / 2 * .pi, clockwise: line)
        path3.close()
        UIColor.gray.setFill()
        path3.fill()
    }
}
