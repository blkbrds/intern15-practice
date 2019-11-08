import UIKit

enum ketQua {
    case phuongTrinhVoNghiem
    case phuongTrinhMotNghiem(x: Double)
    case phuongTrinhHaiNghiem(x1: Double, x2: Double)
}

func phuongTrinhBac2(a: Float, b: Float, c: Float) -> ketQua {
    var delta: Float = (b * b) - (4 * a * c)
    var x1: Float = 0
    var x2: Float = 0
    if delta < 0 {
        return .phuongTrinhVoNghiem
    } else if delta == 0 {
        x1 = -b / (2 * a)
        return .phuongTrinhMotNghiem(x: Double(x1))
    } else {
        delta = sqrt(delta)
        x1 = (-b + delta) / (2 * a)
        x2 = (-b - delta) / (2 * a)
        return .phuongTrinhHaiNghiem(x1: Double(x1), x2: Double(x2))
    }
}
let phuongTrinh = phuongTrinhBac2(a: 1, b: -9, c: 3)
switch phuongTrinh {
case .phuongTrinhVoNghiem:
    print("phuong trinh vo nghiem.")
case .phuongTrinhMotNghiem(let x):
    print("phuong trinh có 1 nghiệm: \(x)")
case .phuongTrinhHaiNghiem(let x):
    print("Phuong trinh co 2 nghiệm: \(x)")
default:
    break
}


