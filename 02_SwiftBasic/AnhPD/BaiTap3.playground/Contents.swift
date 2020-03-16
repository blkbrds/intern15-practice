import UIKit
func ptBacNhat2AnSo(a1 : Double,
                    a2 : Double,
                    b1 : Double,
                    b2 : Double,
                    c1 : Double,
                    c2 :Double ) -> (x : Double,y : Double) {
    let D : Double = a1 * b2 - a2 * b1
    let Dx : Double = c1 * b2 - c2 * b1
    let Dy : Double = a1 * c2 - a2 * c1
    let x : Double = Dx / D
    let y : Double = Dy / D
    return(x,y)
}
print(ptBacNhat2AnSo(a1: 1, a2: 2, b1: 3, b2: 1, c1: 1, c2: 2))
