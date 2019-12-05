import UIKit

//Giai phuong trinh bac nhat 2 an theo phuong phap Cramer
func phuongTrinhBacNhatHaiAn (a1: Double, b1: Double, c1: Double, a2: Double, b2: Double, c2: Double) {
    let D = a1 * b2 - a2 * b1, Dx = c1 * b2 - c2 * b1, Dy = a1 * c2 - a2 * c1
    if (D == 0) {
        if (Dx + Dy == 0) {
            print("Phuong trinh co vo so nghiem")
        }
        else {
            print("Phuong trinh vo nghiem")
        }
    }
    else {
        let x = Dx / D, y = Dy / D
        print("Phuong trinh co 2 nghiem la x= \(x) va y= \(y)")
    }
}

let a1: Double = -3, b1: Double = 2, c1: Double = 12, a2: Double = 1, b2: Double = 2, c2: Double = 8
phuongTrinhBacNhatHaiAn(a1: a1, b1: b1, c1: c1, a2: a2, b2: b2, c2: c2)

