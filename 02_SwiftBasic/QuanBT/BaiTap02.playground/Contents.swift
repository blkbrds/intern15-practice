import UIKit

func quadraticEquation2(a: Double, b: Double, c: Double) -> String {
    let delta = pow(b, 2) - 4 * a * c
    let x = -b / 2 * a
    let x1 = (-b + sqrt(delta)) / (2 * a)
    let x2 = (-b - sqrt(delta)) / (2 * a)
    if delta<0 {
        return "Phương trình vô nghiệm"
    } else if delta==0 {
        return "Phương trình có nghiệm kép \(x)"
    } else {
        return "Phương trình có 2 nghiệm phân biệt: x1 = \(x1) , x2 = \(x2)"
    }
}
print(quadraticEquation2(a: 2, b: 7, c: 3))
