import UIKit

var str = "Hello, playground"
enum CacNghiem {
    case voNghiem
    case voSoNghiem
    case haiNghiem(x: Float, y: Float)
}
func giaiHePT (a1: Float, a2: Float, b1: Float, b2: Float, c1: Float, c2: Float ) -> CacNghiem {
    let dinhThucD  = a1 * b2 - a2 * b1
    let dinhThucDx = c1 * b2 - c2 * b1
    let dinhThucDy = a1 * c2 - a2 * c1
    if dinhThucD == 0 {
        if dinhThucDx + dinhThucDy == 0 {
            return.voSoNghiem
        } else {
            return.voNghiem
        }
    } else {
        return.haiNghiem (x: dinhThucDx / dinhThucD, y: dinhThucDy / dinhThucD )
    }
}
var ketQua = giaiHePT(a1: 3, a2: -3, b1: 4, b2: -2, c1: 3, c2: 3)
print(ketQua)
