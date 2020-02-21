import UIKit

class A {
    let n: Int

    init(n: Int) {
        self.n = n
    }

    func tinhTong() -> Int {
        var sum: Int = 0
        for i in 1...n {
            sum += i
        }
        return sum
    }
}

let a = A(n: 5)
print(a.tinhTong())
