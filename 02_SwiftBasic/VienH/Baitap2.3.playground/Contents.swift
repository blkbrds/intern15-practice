import UIKit

enum KetQua {
    case ptvsn
    case ptvn
    case pt2n(x:Double, y:Double)
}

func ptb1(a1: Float, b1: Float, c1: Float, a2: Float, b2: Float, c2: Float) -> KetQua {
    var d = a1 * b2 - a2 * b1
    var dx = c1 * b2 - c2 * b1
    var dy = a1 * c2 - a2 * c1
    d = a1 * b2 - a2 * b1
    dx = c1 * b2 - c2 * b1
    dy = a1 * c2 - a2 * c1
    if d == 0 {
        if dx + dy == 0 {
            return .ptvn
        }
        else {
            return .ptvsn
        }
    } else {
        let x = Double(dx / d)
        let y = Double(dy / d)
        return .pt2n (x: x, y: y)
    }
}

 let phuongtrinhbatnhat = ptb1(a1: 4, b1: 4, c1: -6, a2: 4, b2: 6, c2: 8)
switch phuongtrinhbatnhat{
case.ptvn:
    print("phuong trinh vo nghiem")
case.ptvsn:
    print("phuong trinh vo so nghiem")
case.pt2n(let x):
    print("phuong trinh co 2 ngiem:\(x)")
default:
    break
}

