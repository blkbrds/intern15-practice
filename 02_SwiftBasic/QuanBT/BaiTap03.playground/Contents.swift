import UIKit

func equations(a1: Double, b1: Double, c1: Double, a2: Double, b2: Double, c2: Double) -> String {
    let d = a1 * b2 - a2 * b1
    let dx = c1 * b2 - c2 * b1
    let dy = a1 * c2 - a2 * c1
    
    if d==0 {
        if dx + dy==0 {
            return "Hệ phương trình có vô số nghiệm"
        } else {
            return "Hệ phương trình vô nghiệm"
        }
    } else {
        let x = dx / d
        let y = dy / d
        return "Hệ phương trình có nghiệm (x,y) là (\(x),\(y))"
    }
}
print(equations(a1: 2, b1: 1, c1: 3, a2: -1, b2: 6, c2: 5))
