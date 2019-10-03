import UIKit
public func phuongTrinhBacNhat2An(a1: Double, b1: Double, c1: Double, a2: Double, b2: Double, c2: Double)
{
    let D: Double = a1 * b2 - a2 * b1
    let Dx: Double = c1 * b2 - c2 * b1
    let Dy: Double = a1 * c2 - a2 * c1
    if D == 0 {
        if Dx + Dy == 0 {
            print("He phuong trinh co vo so nghiem")
        }
        else {
            print("He phuong trinh vo nghiem");
        }
    } else {
        let x: Double = Dx / D;
        let y: Double = Dy / D;
        print("He phuong trinh co nghiem")
        print("x = ", x)
        print("y = ", y)
    }
}
print("He phuong trinh:")
print("a1*x + b1*y = c1")
print("a2*x + b2*y = c2")
let sum = phuongTrinhBacNhat2An(a1: 1, b1: 2, c1: 4, a2: 6, b2: 7, c2: 9)

