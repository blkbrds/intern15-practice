import UIKit

//BaiTap03
func giaiHePhuongTrinhBacNhat2An(a1: Int, b1: Int, c1: Int, a2: Int, b2: Int, c2: Int) -> (chuThich: String, x: Double?, y: Double?) {
    let d = a1 * b2 - a2 * b1
    let dx = c1 * b2 - c2 * b1
    let dy = a1 * c2 - a2 * c1
    if d == 0 {
        if dx + dy == 0 {
            //Vo so nghiem
            return ("He vo so nghiem", nil, nil)
        } else {
            // Vo nghiem
            return ("He vo nghiem", nil, nil)
        }
    } else {
        let x = String(format: "%.4f", Double(dx) / Double(d))
        let y = String(format: "%.4f", Double(dy) / Double(d))
        return ("He co nghiem duy nhat", Double(x) , Double(y))
    }
}
let result = giaiHePhuongTrinhBacNhat2An(a1: 2, b1: 1, c1: 3, a2: 1, b2: -1, c2: 1)
result.chuThich
result.x
result.y
