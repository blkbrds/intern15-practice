import UIKit

class PaintView: UIView {

    func draw()  {
        var toaDoY: Int = 650
        let wayPath: Int = 4
        for _ in 0...wayPath {
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 80, y: toaDoY))
            bezierPath.addLine(to: CGPoint(x: 350, y: toaDoY))
            bezierPath.close()
            
            let shapeLayer = CAShapeLayer()
            shapeLayer.strokeColor = UIColor.black.cgColor
            shapeLayer.lineWidth = 1
            shapeLayer.path = bezierPath.cgPath
            
            self.layer.addSublayer(shapeLayer)
            
            toaDoY -= 80
        }
        
        let rectangleView = UIView(frame: CGRect(x: 100, y: 450, width: 20, height: 200))
        rectangleView.backgroundColor = .red
        self.addSubview(rectangleView)
        
        let rectangle1View = UIView(frame: CGRect(x: 150, y: 470, width: 20, height: 180))
        rectangle1View.backgroundColor = .blue
        self.addSubview(rectangle1View)
        
        let rectangle2View = UIView(frame: CGRect(x: 200, y: 400, width: 20, height: 250))
        rectangle2View.backgroundColor = .green
        self.addSubview(rectangle2View)
        
        let rectangle3View = UIView(frame: CGRect(x: 250, y: 490, width: 20, height: 160))
        rectangle3View.backgroundColor = .black
        self.addSubview(rectangle3View)
        
        let rectangle4View = UIView(frame: CGRect(x: 300, y: 420, width: 20, height: 230))
        rectangle4View.backgroundColor = .gray
        self.addSubview(rectangle4View)

    }
}
