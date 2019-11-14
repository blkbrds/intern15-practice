import UIKit

enum PhuongTrinhBac2 {
    case PTVoNghiem
    case PTVoSoNghiem
    case PTCo1Nghiem(x: Double)
    case PTCo2Nghiem(x1: Double, x2: Double)
}

func giaiPTBac2(a: Double, b: Double, c: Double) -> PhuongTrinhBac2 {
    if a == 0 {
        if b == 0 {
            if c == 0 {
                return .PTVoSoNghiem
            }
            return .PTVoNghiem
        } else {
            let x: Double = -c / b
            return .PTCo1Nghiem(x: x)
        }
    } else {
        let denta: Double = b * b - 4 * a * c
        if denta < 0 {
            return .PTVoNghiem
        } else if denta == 0 {
            let x: Double = -b / (2 * a)
            return .PTCo1Nghiem(x: x)
        } else {
            let x1: Double = (-b + sqrt(denta)) / (2 * a)
            let x2: Double = (b + sqrt(denta)) / (2 * a)
            return .PTCo2Nghiem(x1: x1, x2: x2)
        }
    }
}

let nghiem = giaiPTBac2(a: -1, b: 2, c: 3)

switch nghiem {
case .PTVoNghiem:
    print("PT Vo Nghiem")
case .PTVoSoNghiem:
    print("PT Vo So Nghiem")
case .PTCo1Nghiem(x: let nghiem):
    print("PT có 1 nghiem  : \(nghiem)")
case .PTCo2Nghiem(x: let nghiem): //tra ve tuples
    print("PT có 2 nghiem : \(nghiem)")
}
