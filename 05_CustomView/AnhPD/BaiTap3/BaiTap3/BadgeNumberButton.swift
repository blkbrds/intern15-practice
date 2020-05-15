
import UIKit

class BadgeNumberButton: UIView {
    var button: UIButton?
    var hienThiSo = UILabel()
    var viTriLabel: BadgeNumber
    var text: String = ""
    
    enum BadgeNumber {
        case topLeft
        case topRight
        case topCenter
        case centerLeft
        case centerRight
        case bottomLeft
        case bottomRight
        case bottomCenter
    }
    
    
    init(frame: CGRect,viTriLabel: BadgeNumber,text: String) {
        self.viTriLabel = viTriLabel
        self.text = text
        super.init(frame: frame)
        button = UIButton(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        button?.backgroundColor = .red
        button?.setTitle("text", for: .normal)
        button?.layer.cornerRadius = 10
        addSubview(button!)
        
        //tao label hien thi so
        let widthHienThiSo = 20 + text.count * 10
        hienThiSo.frame.size = CGSize(width: widthHienThiSo, height: 30)
        hienThiSo.text = text
        hienThiSo.backgroundColor = .red
        hienThiSo.textColor = .white
        hienThiSo.textAlignment = .center
        hienThiSo.layer.cornerRadius = 10
        hienThiSo.clipsToBounds = true
        
        //Xét vị trí cho label hien thi so nam trong button
        switch viTriLabel {
        case .topLeft:
            hienThiSo.center = CGPoint(x: 0, y: 0)
        case .topRight:
            hienThiSo.center = CGPoint(x: button!.frame.maxX, y: 0)
        case .topCenter:
            hienThiSo.center = CGPoint(x: button!.frame.midX, y: 0)
        case .centerLeft:
            hienThiSo.center = CGPoint(x: 0, y: button!.frame.midY)
        case .centerRight:
            hienThiSo.center = CGPoint(x: button!.frame.maxX, y: button!.frame.midY)
        case .bottomLeft:
            hienThiSo.center = CGPoint(x: 0, y: button!.frame.maxY)
        case .bottomRight:
            hienThiSo.center = CGPoint(x: button!.frame.maxX, y: button!.frame.maxY)
        case .bottomCenter:
            hienThiSo.center = CGPoint(x: button!.frame.midX, y: button!.frame.maxY)
        }
        
        if hienThiSo.text != "0" {
        addSubview(hienThiSo)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
