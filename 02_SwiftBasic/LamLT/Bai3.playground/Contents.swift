import UIKit

class Equation2Grace{
    func solveEquation2Grace(a1: Float,a2: Float,b1: Float,b2: Float,c1: Float,c2: Float){
        var x: Float,y: Float
        let d: Float = a1 * b2 - a2 * b1
        let d1: Float = c1 * b2 - c2 * b1
        let d2: Float = a1 * c2 - a2 * c1
        
        if d == 0 {
            if d1 == d2{
                print("Quation has infiniti solution")
            }
            else{
                print("Quation has no solution")
            }
        }
        else{
            print("Quation has one solution")
            x = d1/d
            y = d2/d
            print("x = \(x) y = \(y)")
        }
    }
}

let x = Equation2Grace()
x.solveEquation2Grace(a1: 2, a2: 3, b1: 1, b2: 2, c1: 4, c2: 7)
x.solveEquation2Grace(a1: 3, a2: 4, b1: -2, b2: -5, c1: 11, c2: 3)
