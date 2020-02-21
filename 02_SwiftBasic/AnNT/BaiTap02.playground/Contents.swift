import UIKit

//BaiTap02
func giaiPhuongTrinhBacHai(a: Int, b: Int, c: Int) -> (chuThich: String, x1: Double?, x2: Double?) {
    if a == 0 {
        if b == 0 {
            return ("Phuong trinh vo so nghiem", nil, nil)
        } else {
            let x = Double(-c) / Double(b)
            let xFixed = Double(String(format: "%.4f", x))
            return ("Phuong trinh co 1 nghiem", xFixed, nil)
        }
    } else {
        let delta = b * b - 4 * a * c
        if delta == 0 {
            let x = Double(-b) / Double((2 * a))
            let xFixed = Double(String(format: "%.4f", x))
            return ("Phuong trinh co nghiem kep", xFixed, xFixed)
        } else if delta < 0 {
            return ("Phuong trinh vo nghiem", nil, nil)
        } else {
            let x1 = Double(-b) + sqrt(Double(delta)) / Double((2 * a))
            let x2 = Double(-b) - sqrt(Double(delta)) / Double((2 * a))
            let x1Fixed = Double(String(format: "%.4f", x1))
            let x2Fixed = Double(String(format: "%.4f", x2))
            return ("Phuong trinh co hai nghiem phan biet", x1Fixed, x2Fixed)
        }
    }
}
giaiPhuongTrinhBacHai(a: 2, b: -4, c: 5)
giaiPhuongTrinhBacHai(a: 0, b: -4, c: 5)
giaiPhuongTrinhBacHai(a: 3, b: -10, c: 5)
