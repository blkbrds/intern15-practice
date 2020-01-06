import UIKit

enum Nghiem {
    case voNghiem
    case motNghiem(Float)
    case haiNghiem(Float, Float)
    case voSoNghiem
}

func giaiPhuongTrinh(a: Double, b: Double, c: Double) -> Nghiem {
    var x1: Double = 0
    var x2: Double = 0
    if a == 0 {
        return .voNghiem
    } else {
        let delta = b * b - 4 * a * c
        if delta < 0 {
            return .voNghiem
        } else {
            if delta == 0 {
                x1 = -b / (2 * a)
                x2 = -b / (2 * a)
            } else {
                x1 = (-b + sqrt(delta)) / (2 * a)
                x2 = (-b - sqrt(delta)) / (2 * a)
            }
        }
    }
    return .haiNghiem(Float(x1), Float(x2))
}

let a: Double = 2
let b: Double = -4
let c: Double = 2
let ketQua = giaiPhuongTrinh(a: a, b: b, c: c)

//su dung
switch ketQua {
case .voNghiem:
    print("Phuong trinh vo nghiem")
case .voSoNghiem:
    print("Phuong trinh vo so nghiem")
case .motNghiem(let x):
    print("Phuong trinh nghiem x = \(x)")
case .haiNghiem(let x1, let x2):
    print("Nghiem x1 = \(x1), x2 = \(x2)")
}
