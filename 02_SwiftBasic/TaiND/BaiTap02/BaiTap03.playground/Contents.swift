import UIKit

func hePTBacNhat(a1: Double, b1: Double, c1: Double, a2: Double, b2: Double, c2: Double) {
    var d: Double = a1 * b2 - a2 * b1
    var dx: Double = c1 * b2 - c2 * b1
    var dy: Double = a1 * c2 - a2 * c1
    var x: Double = dx / d
    var y: Double = dy / d

    print("Phuong trinh co nghiem x la: \(x)")
    print("Phuong trinh co nghiem y la: \(y)")
}
hePTBacNhat(a1: 6, b1: 3, c1: 2, a2: 2, b2: 4, c2: 2)
