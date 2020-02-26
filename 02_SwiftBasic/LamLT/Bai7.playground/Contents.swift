import UIKit

class Array {
    func change(a: [Int], x: Int, y: Int) -> [Int] {
        var n = a

        for index in 0..<n.count {
            if n[index] == x {
                n[index] = y
            }
        }
        print(n)
        return n
    }
}

let x = Array()
x.change(a: [1, 2, 1, 4, 1], x: 1, y: 3)
