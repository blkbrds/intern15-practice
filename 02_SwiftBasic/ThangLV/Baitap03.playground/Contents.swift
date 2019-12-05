import UIKit

//Giai phuong trinh bac nhat 2 an theo phuong phap Cramer
func phuongTrinhBacNhatHaiAn(a1: Double, b1: Double, c1: Double, a2: Double, b2: Double, c2: Double) {
    let d: Double = a1 * b2 - a2 * b1
    let dX: Double = c1 * b2 - c2 * b1
    let dY: Double = a1 * c2 - a2 * c1
    if (d == 0) {
        if (dX + dY == 0) {
            print("Phuong trinh co vo so nghiem")
        }
        else {
            print("Phuong trinh vo nghiem")
        }
    }
    else {
        let x = dX / d, y = dY / d
        print("Phuong trinh co 2 nghiem la x= \(x) va y= \(y)")
    }
}

let a1: Double = -3
let b1: Double = 2
let c1: Double = 12
let a2: Double = 1
let b2: Double = 2
let c2: Double = 8
phuongTrinhBacNhatHaiAn(a1: a1, b1: b1, c1: c1, a2: a2, b2: b2, c2: c2)

