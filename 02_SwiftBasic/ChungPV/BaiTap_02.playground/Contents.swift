//import UIKit
import Foundation

public func phuongtrinhbac2(a: Float, b: Float, c: Float) -> (x1: Float, x2: Float) {
    var x1 : Float
    var x2 : Float
    let delta : Float = b * b - 4 * a * c
    if delta < 0 {
        x1 = 0.0
        x2 = 0.0
        return (x1,x2)
    } else if delta == 0 {
            x1 = -b/(2*a)
            x2 = x1
            return (x1,x2)
    } else {
        x1 = (-b + delta) / (2*a);
        x2 = (-b - delta) / (2*a);
        return (x1,x2)
    }
        
}

phuongtrinhbac2(a: 3, b: 4, c: 1)
