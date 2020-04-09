import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var toaDoY: Int = 650
        
        for i in 0...3 {
            let wayPath = PaintView()
            wayPath.draw(start: CGPoint(x: 80, y: toaDoY), end: CGPoint(x: 350, y: toaDoY))
            toaDoY -= 80
            view.addSubview(wayPath)
        }
        
        let rectangle = PaintView()
        let rectangleView = rectangle.drawHinhChuNhat(rect: CGRect(x: 100, y: 450, width: 20, height: 200), color: .red)
        view.addSubview(rectangleView)
        
        let rectangle1View = rectangle.drawHinhChuNhat(rect: CGRect(x: 150, y: 400, width: 20, height: 250), color: .black)
        view.addSubview(rectangle1View)
        
        let rectangle2View = rectangle.drawHinhChuNhat(rect: CGRect(x: 200, y: 470, width: 20, height: 180), color: .gray)
        view.addSubview(rectangle2View)
        
        let rectangle3View = rectangle.drawHinhChuNhat(rect: CGRect(x: 250, y: 490, width: 20, height: 160), color: .green)
        view.addSubview(rectangle3View)
        
        let rectangle4View = rectangle.drawHinhChuNhat(rect: CGRect(x: 300, y: 420, width: 20, height: 230), color: .blue)
        view.addSubview(rectangle4View)
        
    }
}
