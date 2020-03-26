import UIKit

class A {
    var arrayInput: [Int]
    
    init(arrayInput: [Int]) {
        self.arrayInput = arrayInput
    }
    
    func sum(a: A) -> Int {
        var s: Int = 0
        let instaneOfArray = a.arrayInput
        for index in 0..<instaneOfArray.count {
            s += instaneOfArray[index]
        }
        return s
    }
}

let t = A(arrayInput: [5,1,2,7,8,12,-5,-10])
print(t.sum(a: t))
