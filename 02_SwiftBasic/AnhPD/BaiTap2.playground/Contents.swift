import UIKit

func giaiPTBac2(a: Double,b: Double,c: Double) {
    var delta: Double = 0
    delta = b * b - (4 * a * c)
    let kep: Double = -b / (2 * a)
    let x1: Double = -b + delta / (2 * a)
    let x2: Double = -b - delta / (2 * a)
    if delta > 0 {
        print("PT co 2 nghiem phan biet \(x1) va \(x2)")
    }else if delta == 0 {
        print("PT co nghiem kep \(kep)")
    }else {
        print("PT vo nghiem")
    }
}
giaiPTBac2(a: 1, b: 5, c: 1)
