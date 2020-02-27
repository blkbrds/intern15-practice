import UIKit

class Mang1C {
    var arr = [Int]()

    init(arr: [Int]) {
        self.arr = arr
    }

    func inputArray(a: Mang1C) -> [Int] {
        let x = a.arr
        return x
    }
    
    func maxNumberArray(a: Mang1C) -> Int {
        let n = a.arr
        var max = n[0]
        for i in 0..<n.count {
            if max < n[i] {
                max = n[i]
            }
        }
        return max
    }
    
    func minNumberArray(a: Mang1C) -> Int {
        let n = a.arr
        var min = n[0]
        for i in 0..<n.count {
            if min > n[i] {
                min = n[i]
            }
        }
        return min
    }
}

let x = Mang1C(arr: [5,5,1,2,6,7,2,12,-6])
let i = x.inputArray(a: x)
print(i)
let max = x.maxNumberArray(a: x)
print("Max = \(max)")
let min = x.minNumberArray(a: x)
print("Min = \(min)")
