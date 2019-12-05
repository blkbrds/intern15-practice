import UIKit

func giaiPhuongTrinh (a: Double, b: Double, c: Double) -> (x1: Double, x2: Double) {
    var x1 = 0.0, x2 = 0.0
    if (a == 0) {
        return (-1.0, -1.0)
    } else {
        let delta = b * b - 4 * a * c
        if (delta < 0) {
            return (-1.0, -1.0)
        }
        else {
            if (delta == 0) {
                x1 = (-b) / (2 * a)
                x2 = (-b) / (2 * a)
            }
            else {
                x1 = (-b + sqrt(delta)) / (2 * a)
                x2 = ((-b - sqrt(delta)) / (2 * a))
            }
        }
    }
    return (x1, x2)
}

let a = 2.0, b = -3.0, c = -5.0
print(giaiPhuongTrinh(a: a, b: b, c: c))
