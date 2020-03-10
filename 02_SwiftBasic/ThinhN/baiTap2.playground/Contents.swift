import UIKit

var str = "Hello, playground"


enum soNghiem {
    case motNghiem (x: Float)
    case haiNghiem (x1: Float, x2: Float)
    case voNghiem
    case voSoNghiem
    case nghiemKep (x: Float)
}
func giaiPhuongTrinhBacHai(a: Float, b: Float, c: Float) -> soNghiem {
    if a == 0 {
        if b == 0 {
            if c == 0 {
                return .voSoNghiem
            }
        }
        if a == 0 {
            return .motNghiem(x: -c / b)
        }
    }
    let delta = b * b - 4 * a * c
    if delta < 0 {
        return.voNghiem
    } else if delta == 0 {
        return .nghiemKep(x : (-b) / 2 * a)
    } else {
        return .haiNghiem(x1: ((-b) - sqrt(delta)) / 2 * a, x2: ((-b) + sqrt(delta)) / 2 * a)
    }
}

giaiPhuongTrinhBacHai(a: 0, b: 0, c: -6)
