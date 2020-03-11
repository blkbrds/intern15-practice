import UIKit

func quadraticEquation2(_ a: Double,_ b: Double,_ c: Double) -> String{
    let denta = pow(b, 2) - 4 * a * c
    let x = -b / 2 * a
    let x1 = (-b + sqrt(denta)) / (2 * a)
    let x2 = (-b - sqrt(denta)) / (2 * a)
    if (denta < 0) {
        return "Phương trình vô nghiệm"
    }else if(denta == 0) {
        return "Phương trình có nghiệm kép \(x)"
    }else{
        return "Phương trình có 2 nghiệm phân biệt: x1 = \(x1) , x2 = \(x2)"
    }
}
print(quadraticEquation2(2,-7,3))
