import UIKit

class A {
    var arr: [Int]
    
    init(arr: [Int]) {
        self.arr = arr
    }
    
    func sum(a: A) -> Int {
        var s: Int = 0
        let x = a.arr
        for index in 0..<x.count {
            s += x[index]
        }
        return s
    }
}

let t = A(arr: [5,1,2,7,8,12,-5,-10])
print(t.sum(a: t))
