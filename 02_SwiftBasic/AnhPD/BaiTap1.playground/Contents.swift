import UIKit

func tinhSVaVHinhCau(r: Int) -> (s: Double,v: Double) {
    var s: Double = 0
    var v: Double = 0
    s = 4 * .pi * Double(r) * Double(r)
    v = (4 * .pi * Double(r) * Double (r) * Double (r)) / 3
    return (s,v)
}
tinhSVaVHinhCau(r: 4)
