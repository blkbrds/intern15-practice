import UIKit

enum Nghiem {
    case vonghiem
    case motnghiem(Float)
    case hainghiem(Float, Float)
    case vosonghiem
}

func giaiPhuongTrinh (a: Double, b: Double, c: Double) -> Nghiem {
    var x1: Double = 0
    var x2: Double = 0
    if (a == 0) {
        return .vonghiem
    } else {
        let delta = b * b - 4 * a * c
        if (delta < 0) {
            return .vonghiem
        } else {
            if (delta == 0) {
                x1 = (-b) / (2 * a)
                x2 = (-b) / (2 * a)
            } else {
                x1 = (-b + sqrt(delta)) / (2 * a)
                x2 = ((-b - sqrt(delta)) / (2 * a))
            }
        }
    }
    return .hainghiem(Float(x1), Float(x2))
}

let a: Double = 2
let b: Double = -4
let c: Double = 2
let ketqua = giaiPhuongTrinh(a: a, b: b, c: c)

//su dung
switch ketqua {
case .vonghiem:
    print("Phuong trinh vo nghiem")
case .vosonghiem:
    print("Phuong trinh vo so nghiem")
case .motnghiem(let x):
    print("Phuong trinh nghiem x = \(x)")
case .hainghiem(let x1, let x2):
    print("Nghiem x1 = \(x1), x2 = \(x2)")
}
