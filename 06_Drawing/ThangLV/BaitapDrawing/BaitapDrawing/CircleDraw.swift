import UIKit

class CircleDraw: UIView {

    override func draw(_ rect: CGRect) {
        let circlePath = UIBezierPath(ovalIn: CGRect(x: 100, y: 200, width: 150, height: 150))
        var segments: [CAShapeLayer] = []
        let segmentAngle: CGFloat = (360 / 3) / 360

        for i in 0...2 {
            let circleLayer = CAShapeLayer()
            circleLayer.path = circlePath.cgPath

            circleLayer.strokeStart = segmentAngle * CGFloat(i)

            let gapSize: CGFloat = 0.001
            circleLayer.strokeEnd = circleLayer.strokeStart + segmentAngle - gapSize

            circleLayer.lineWidth = 50
            switch i {
            case 0:
                circleLayer.strokeColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1).cgColor
            case 1:
                circleLayer.strokeColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1).cgColor
            case 2:
                circleLayer.strokeColor = UIColor(red: 0, green: 0, blue: 1, alpha: 1).cgColor
            default:
                break
            }

            circleLayer.fillColor = UIColor.clear.cgColor

            segments.insert(circleLayer, at: i)
            layer.addSublayer(segments[i])
        }
    }

}
