import UIKit

enum ketQua {
    case phuongTrinhVoSoNghiem
    case phuongTrinhVoNghiem
    case phuongTrinhHaiNghiem(x: Double, y: Double)
}

func phuongTrinhBac1(a1: Float, b1: Float, c1: Float, a2: Float, b2: Float, c2: Float) -> ketQua {
    var d = a1 * b2 - a2 * b1
    var dx = c1 * b2 - c2 * b1
    var dy = a1 * c2 - a2 * c1
    d = a1 * b2 - a2 * b1
    dx = c1 * b2 - c2 * b1
    dy = a1 * c2 - a2 * c1
    if d == 0 {
        if dx + dy == 0 {
            return .phuongTrinhVoNghiem
        } else {
            return .phuongTrinhVoSoNghiem
        }
    } else {
        let x = Double(dx / d)
        let y = Double(dy / d)
        return .phuongTrinhHaiNghiem(x: x, y: y)
    }
}

let phuongTrinhBacNhat = phuongTrinhBac1(a1: 4, b1: 4, c1: -6, a2: 4, b2: 6, c2: 8)
switch phuongTrinhBacNhat {
case.phuongTrinhVoNghiem:
    print("phuong trinh vo nghiem")
case.phuongTrinhVoSoNghiem:
    print("phuong trinh vo so nghiem")
case.phuongTrinhHaiNghiem(let x):
    print("phuong trinh co 2 ngiem:\(x)")
default:
    break
}

