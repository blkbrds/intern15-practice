import UIKit

enum HePTBac1 {
    case PTvoSoNghiem
    case PTvoNghiem
    case nghiem(x: Double, y: Double)
}

func baiTap03(a1: Double, b1: Double, c1:Double, a2: Double, b2: Double, c2:Double) -> HePTBac1 {
    
    var D: Double; var Dx: Double; var Dy: Double; var x: Double; var y: Double;
    D = a1 * b2 - a2 * b1
    Dx = c1 * b2 - c2 * b1
    Dy = a1 * c2 - a2 * c1
    if (D == 0) {
        if (Dx + Dy == 0) {
            return .PTvoSoNghiem
        }else {
            return .PTvoNghiem
        }
    }
    else {
        x = Dx / D
        y = Dy / D
        return .nghiem(x: x, y: y)
    }
}

let nghiem = baiTap03(a1: 0, b1: 5, c1: -10, a2: 2, b2: 4, c2: 23)
switch nghiem {
case .PTvoNghiem:
    print("He PT vo nghiem")
case .PTvoSoNghiem:
    print("He PT vo so nghiem")
case .nghiem(let xy):
    print("He PT co nghiem (x,y) = \(xy)")
}
