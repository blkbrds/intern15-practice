import UIKit

enum HePTBac1 {
    case PTVoSoNghiem
    case PTVoNghiem
    case PTCoNghiem(x: Double, y: Double)
}

func giaiHePTBac1(a1: Double, b1: Double, c1: Double, a2: Double, b2: Double, c2: Double) -> HePTBac1 {
    var d: Double
    var dX: Double
    var dY: Double
    var x: Double
    var y: Double
    d = a1 * b2 - a2 * b1
    dX = c1 * b2 - c2 * b1
    dY = a1 * c2 - a2 * c1
    if (d == 0) {
        if (dX + dY == 0) {
            return .PTVoSoNghiem
        } else {
            return .PTVoNghiem
        }
    } else {
        x = dX / d
        y = dY / d
        return .PTCoNghiem(x: x, y: y)
    }
}

let nghiem = giaiHePTBac1(a1: 0, b1: 5, c1: -10, a2: 2, b2: 4, c2: 23)

switch nghiem {
case .PTVoNghiem:
    print("He PT vo nghiem")
case .PTVoSoNghiem:
    print("He PT vo so nghiem")
case .PTCoNghiem(let xy):
    print("He PT co nghiem (x,y) = \(xy)")
}
