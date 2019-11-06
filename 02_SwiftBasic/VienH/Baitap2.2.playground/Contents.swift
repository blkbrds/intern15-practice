import UIKit

func ptb2(a: Float, b: Float, c: Float) {
    var delta: Float = (b * b) - (4 * a * c)
    var x1: Float = 0
    var x2: Float = 0


    if delta < 0 {
        print("phuong trinh vo nghiem")
    } else if delta == 0 {
        x1 = -b / (2 * a)
        print("nghiem cua x1 la:", x1)
        x2 = -b / (2 * a)
        print("nghiem cua x2 la:", x2)

    } else {
        delta = sqrt(delta)
        x1 = (-b + delta) / (2 * a)
        print("nghiem cua x1 la", x1)
        x2 = (-b - delta) / (2 * a)
        print("nghiem cua x2 la", x2)
    }
}
ptb2(a: 1, b: -9, c: 3)

