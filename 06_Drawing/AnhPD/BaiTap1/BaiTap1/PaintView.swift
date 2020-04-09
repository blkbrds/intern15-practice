import UIKit

class PaintView: UIView {

    func drawHinhChuNhat(rect: CGRect,color: UIColor) -> UIView {
        let view1 = UIView(frame: rect)
        view1.backgroundColor = color
        return view1
    }
    
    func draw(start: CGPoint,end: CGPoint) {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: start)
        bezierPath.addLine(to: end)
        bezierPath.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.path = bezierPath.cgPath
        
        self.layer.addSublayer(shapeLayer)
    }

}
