import Foundation

public func bacNhat2An(a1: Int, b1: Int, c1: Int, a2: Int, b2: Int, c2: Int ){
    let d: Float =  Float(a1 * b2 - a2 * b1)
    let dx: Float = Float(c1 * b2 - c2 * b1)
    let dy: Float = Float(a1 * c2 - a2 * c1)
    var x: Float
    var y: Float
    if d==0 {
        if (dx + dy)==0 {
            print("Vo so nghiem")
        } else {
            print("Vo nghiem")
        }
    } else {
        x = dx/d
        y = dx/d
        print("Gia tri x la \(x) , gia tri y la \(y)")
    }
}
bacNhat2An(a1: 1, b1: 2, c1: 3, a2: 1, b2: 2, c2: 3)
