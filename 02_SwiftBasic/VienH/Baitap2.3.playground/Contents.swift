import UIKit

public func phuongTrinhBacNhatHaiAn(a1: Float, b1: Float, c1: Float, a2: Float, b2: Float, c2: Float) {
    var d = a1 * b2 - a2 * b1
    var dx = c1 * b2 - c2 * b1
    var dy = a1 * c2 - a2 * c1
    d = a1 * b2 - a2 * b1
    dx = c1 * b2 - c2 * b1
    dy = a1 * c2 - a2 * c1
    if d == 0 {
        if dx + dy == 0 {
            print("He phuong trinh co vo so nghiem")
        }
        else {
            print("He phuong trinh vo nghiem")
        }
    } else {
        let x: Double = Double(dx / d)
        let y: Double = Double(dy / d)
        print("He phuong trinh co nghiem")
        print("x = ", x)
        print("y = ", y)
    }
}
print("He phuong trinh:")
print("a1*x + b1*y = c1")
print("a2*x + b2*y = c2")
phuongTrinhBacNhatHaiAn(a1: 4, b1: 4, c1: -6, a2: 4, b2: 6, c2: 8)

