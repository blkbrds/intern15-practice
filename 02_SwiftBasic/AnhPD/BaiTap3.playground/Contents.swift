import UIKit

func giaiPTBacNhat2AnSo(a1: Double,b1: Double,c1: Double,a2: Double,b2: Double,c2: Double) -> (x: Double,y: Double) {
    var D: Double = 0
    var Dx: Double = 0
    var Dy: Double = 0
    var x: Double = 0
    var y: Double = 0
    D = a1 * b1 - a2 * b2
    Dx = c1 * b2 - c2 * b2
    Dy = a1 * c2 - a2 * c1
    x = Dx / D
    y = Dy / D
    return(x,y)
}
giaiPTBacNhat2AnSo(a1: 1, b1: 5, c1: 6, a2: 6, b2: 3, c2: 8)
