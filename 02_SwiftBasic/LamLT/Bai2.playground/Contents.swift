import UIKit

class QuadraticEquation {
    func solveQuadraticEquation(a: Double, b: Double, c: Double) -> (Double?, Double?) {
        var x1: Double?
        var x2: Double?
        let delta: Double = pow(b, 2) - 4 * a * c
        if delta < 0 {
            print("No Solution")
            return (nil, nil)
        } else if delta == 0 {
            print("Only One Solution")
            x1 = -b / (2 * a)
            x2 = -b / (2 * a)
        } else if delta > 0 {
            print("Have 2 Solution")
            x1 = (-b + sqrt(delta)) / (2 * a)
            x2 = (-b - sqrt(delta)) / (2 * a)
        }
        return (x1, x2)
    }
}

let x = QuadraticEquation()
x.solveQuadraticEquation(a: 1, b: 3, c: 2)
