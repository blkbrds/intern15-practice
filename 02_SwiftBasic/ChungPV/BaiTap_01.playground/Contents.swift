import Foundation
public func dientich_thetich(r : Float ) -> (s : Float, v: Float) {
    var s: Float = 0
    var v: Float = 0
    
    s = 4 * 3.14 * pow(r,2)
    v = (4/3) * 3.14 * pow(r, 3)
    return (s,v)
}
let s = dientich_thetich(r: 2)
print("Dien tich \(s.s)")
print("Chu vi \(s.v)")
