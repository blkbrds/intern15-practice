import UIKit

enum KetQua {
    case ptvn
    case pt1n(x: Double)
    case pt2n(x1: Double, x2: Double)
}

func ptb2(a: Float, b: Float, c: Float) -> KetQua {

    var delta: Float = (b * b) - (4 * a * c)
    var x1: Float = 0
    var x2: Float = 0

    if delta < 0 {
        return .ptvn
    } else if delta == 0 {
        x1 = -b / (2 * a)
        return .pt1n(x: Double(x1))

    } else {
        delta = sqrt(delta)
        x1 = (-b + delta) / (2 * a)
        x2 = (-b - delta) / (2 * a)
        return .pt2n(x1: Double(x1), x2: Double(x2))
    }
}

let phuongTrinh = ptb2(a: 1, b: -9, c: 3)

switch phuongTrinh {
case .ptvn:
    print("phuong trinh vo nghiem.")
case .pt1n(let x):
    print("phuong trinh có 1 nghiệm: \(x)")
case .pt2n(let x):
    print("Phuong trinh co 2 nghiệm: \(x)")
default:
   break
    
}


