import UIKit

final class A {
    var n: Int
    
    init(n: Int) {
        self.n = n
    }
    
    func sum() {
        var sum = 0
        for item in 1 ..< self.n+1 {
            sum += item
        }
        print("Tổng của \(self.n) số nguyên là: \(sum)")
    }
}

var a: A = A(n: 100)
a.sum()
