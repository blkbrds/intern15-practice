import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let mangToaDo: [String] = ["90","95","100","105"]
        let mangThu: [String] = ["Tue","Wed","Thu","Fri","Sat","Sun"]
        var toaDoY = 650
        var toaDoX = 70
        for i in 0...3 {
            let draw1 = PainTing(frame: view.bounds)
            draw1.drawing(start: CGPoint(x: 60, y: toaDoY), end: CGPoint(x: 370, y: toaDoY))
            view.addSubview(draw1)
            
            let draw2 = UILabel(frame: CGRect(x: 25, y: toaDoY - 15, width: 50, height: 30))
            draw2.text = mangToaDo[i]
            draw2.textColor = .black
            view.addSubview(draw2)
            toaDoY -= 80
        }
        
        for item in 0...5 {
            let draw3 = UILabel(frame: CGRect(x: toaDoX, y: 650, width: 50, height: 25))
            draw3.text = mangThu[item]
            draw3.textColor = .black
            draw3.textAlignment = .center
            view.addSubview(draw3)
            toaDoX += 50
        }
        
        let rectView1 = HinhChuNhat(frame: CGRect(x: 85, y: 500, width: 20, height: 150))
        view.addSubview(rectView1)
        
        let rectView2 = HinhChuNhat(frame: CGRect(x: 135, y: 475, width: 20, height: 175))
        view.addSubview(rectView2)
        
        let rectView3 = HinhChuNhat(frame: CGRect(x: 185, y: 450, width: 20, height: 200))
        view.addSubview(rectView3)
        
        let rectView4 = HinhChuNhat(frame: CGRect(x: 235, y: 550, width: 20, height: 100))
        view.addSubview(rectView4)
        
        let rectView5 = HinhChuNhat(frame: CGRect(x: 285, y: 490, width: 20, height: 160))
        view.addSubview(rectView5)
        
        let rectView6 = HinhChuNhat(frame: CGRect(x: 335, y: 570, width: 20, height: 80))
        view.addSubview(rectView6)
    }
    
}
