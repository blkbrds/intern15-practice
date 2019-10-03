import UIKit

enum phuongTrinhBac2{
    case PTVoNghiem
    case PTVoSoNghiem
    case PTCoMotNghiem(x: Double)
    case PTCoHaiNghiem(x1: Double, x2: Double)
}

func tinhNghiem (a: Double, b: Double, c: Double) -> phuongTrinhBac2 {
    if(a == 0) {
        if(b == 0) {
            if(c == 0) {
                return .PTVoSoNghiem
            }
            return . PTVoNghiem
        } else {
            let x: Double = (-c / b)
            return . PTCoMotNghiem(x: x)
        }
    } else {
        let delta: Double = b * b - 4 * a * c
        if(delta < 0) {
            return . PTVoNghiem
        }
        else if(delta == 0) {
            let x: Double = (-b / 2 * a)
            return . PTCoMotNghiem(x: x)
        }
        else {
            let x1: Double = (-b + sqrt(delta)) / (2 * a)
            let x2: Double = (-b - sqrt(delta)) / (2 * a)
            return .PTCoHaiNghiem(x1: x1, x2: x2)
        }
    }
}
let nghiem = tinhNghiem(a: 0, b: 4,c : 4)
switch nghiem {
case .PTVoNghiem:
    print("phuong trinh vo nghiem")
case .PTVoSoNghiem:
    print("phuong trinh vo so nghiem")
case .PTCoMotNghiem(x: let nghiem):
    print("Pt co 1 nghiem : \(nghiem)")
case .PTCoHaiNghiem(x: let nghiem):
    print("pt co 2 nghiem: \(nghiem)")
}
