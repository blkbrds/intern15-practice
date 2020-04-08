import UIKit

class Mang1C {
    var array1Chieu = [Int]()

    init(array1Chieu: [Int]) {
        self.array1Chieu = array1Chieu
    }

    func inputArray(instaneOFMang1C: Mang1C) -> [Int] {
        let x = instaneOFMang1C.array1Chieu
        return x
    }
    
    func maxNumberArray(instaneOFMang1C: Mang1C) -> Int {
        let instaneOfArray = instaneOFMang1C.array1Chieu
        var max = instaneOfArray[0]
        for i in 0..<instaneOfArray.count {
            if max < instaneOfArray[i] {
                max = instaneOfArray[i]
            }
        }
        return max
    }
    
    func minNumberArray(instaneOFMang1C: Mang1C) -> Int {
        let instaneOfArray = instaneOFMang1C.array1Chieu
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
let i = x.inputArray(instaneOFMang1C: x)
print(i)
let max = x.maxNumberArray(instaneOFMang1C: x)
print("Max = \(max)")
let min = x.minNumberArray(instaneOFMang1C: x)
print("Min = \(min)")
