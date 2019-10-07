import UIKit

enum PhuongTrinhBac2 {
    case pTVoNghiem
    case pTVoSoNghiem
    case pTCoMotNghiem(x: Double)
    case pTCoHaiNghiem(x1: Double, x2: Double)
}

func tinhNghiem(a: Double, b: Double, c: Double) -> PhuongTrinhBac2 {
    if(a == 0) {
        if(b == 0) {
            if(c == 0) {
                return .pTVoSoNghiem
            }
            return .pTVoNghiem
        } else {
            let x: Double = -c / b
            return .pTCoMotNghiem(x: x)
        }
    } else {
        let delta: Double = b * b - 4 * a * c
        if(delta < 0) {
            return .pTVoNghiem
        }
        else if(delta == 0) {
            let x: Double = (-b / 2 * a)
            return .pTCoMotNghiem(x: x)
        }
        else {
            let x1: Double = (-b + sqrt(delta)) / (2 * a)
            let x2: Double = (-b - sqrt(delta)) / (2 * a)
            return .pTCoHaiNghiem(x1: x1, x2: x2)
        }
    }
}
let nghiem = tinhNghiem(a: 0, b: 4, c: 4)
switch nghiem {
case .pTVoNghiem:
    print("phuong trinh vo nghiem")
case .pTVoSoNghiem:
    print("phuong trinh vo so nghiem")
case .pTCoMotNghiem(x: let nghiem):
    print("Pt co 1 nghiem : \(nghiem)")
case .pTCoHaiNghiem(x: let nghiem):
    print("pt co 2 nghiem: \(nghiem)")
}
