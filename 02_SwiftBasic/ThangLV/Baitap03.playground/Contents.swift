import UIKit

enum Nghiem {
    case vosonghiem
    case vonghiem
    case hainghiem(Double, Double)
}

//Giai phuong trinh bac nhat 2 an theo phuong phap Cramer
func phuongTrinhBacNhatHaiAn(a1: Double, b1: Double, c1: Double, a2: Double, b2: Double, c2: Double) -> Nghiem{
    let d: Double = a1 * b2 - a2 * b1
    let dX: Double = c1 * b2 - c2 * b1
    let dY: Double = a1 * c2 - a2 * c1
    if (d == 0) {
        if (dX + dY == 0) {
            return .vosonghiem
        } else {
            return .vonghiem
        }
    } else {
        let x = dX / d, y = dY / d
        return .hainghiem(x, y)
    }
}

let a1: Double = -3
let b1: Double = 3
let c1: Double = 12
let a2: Double = -1
let b2: Double = 2
let c2: Double = 8
let ketqua: Nghiem = phuongTrinhBacNhatHaiAn(a1: a1, b1: b1, c1: c1, a2: a2, b2: b2 , c2: c2)

switch ketqua {
case .vosonghiem:
    print("Phuong trinh co vo so nghiem")
case .vonghiem:
    print("Phuong trinh vo nghiem")
case .hainghiem(let x, let y):
    print("Phuong trinh co 2 nghiem \(x) va \(y)")
}

