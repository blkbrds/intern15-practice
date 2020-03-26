import UIKit

class Mang1C {
    var array1Chieu = [Int]()

    init(array1Chieu: [Int]) {
        self.array1Chieu = array1Chieu
    }

    func inputArray(a: Mang1C) -> [Int] {
        let x = a.array1Chieu
        return x
    }
    
    func maxNumberArray(a: Mang1C) -> Int {
        let instaneOfArray = a.array1Chieu
        var max = instaneOfArray[0]
        for i in 0..<instaneOfArray.count {
            if max < instaneOfArray[i] {
                max = instaneOfArray[i]
            }
        }
        return max
    }
    
    func minNumberArray(a: Mang1C) -> Int {
        let instaneOfArray = a.array1Chieu
        var min = instaneOfArray[0]
        for i in 0..<instaneOfArray.count {
            if min > instaneOfArray[i] {
                min = instaneOfArray[i]
            }
        }
        return min
    }
}

let x = Mang1C(array1Chieu: [5,5,1,2,6,7,2,12,-6])
let i = x.inputArray(a: x)
print(i)
let max = x.maxNumberArray(a: x)
print("Max = \(max)")
let min = x.minNumberArray(a: x)
print("Min = \(min)")
