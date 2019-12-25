import UIKit

class ColumnChartDraw: UIView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawLine(firstPoint: CGPoint(x: 20, y: 300), secondPoint: CGPoint(x: 345, y: 300))
        drawColumn(color: .red)
    }

    private func drawLine(firstPoint: CGPoint, secondPoint: CGPoint) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        var startingPoint: CGPoint = firstPoint
        var endingPoint: CGPoint = secondPoint

        for _ in 1...4 {
            context.setStrokeColor(UIColor.lightGray.cgColor)
            context.setLineWidth(1)

            context.move(to: CGPoint(x: startingPoint.x, y: startingPoint.y))
            context.addLine(to: CGPoint(x: endingPoint.x, y: endingPoint.y))

            context.strokePath()

            startingPoint.y += 100
            endingPoint.y += 100
        }

    }

    private func drawColumn(color: UIColor) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        let heightArray: [Int] = [160, 100, 240, 220, 180, 140, 160]
        var x: Int = 30
        for index in 0...6 {
            context.setLineWidth(10.0)
            context.setFillColor(color.cgColor)
            context.addRect(CGRect(x: x, y: 595 - heightArray[index], width: 10, height: heightArray[index]))
            context.strokePath()
            x += 49
        }
    }
}
