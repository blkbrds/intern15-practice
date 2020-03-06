import UIKit
func dientichvathetichhinhcau(R : Float) -> (V : Float, S : Float) {
    let pi : Float = 3.14
    let S = (4 * pi) * (R * R)
    let V = (4 / 3) * (pi * R * R * R)
    return (S,V)
}
print(dientichvathetichhinhcau(R: 11))
