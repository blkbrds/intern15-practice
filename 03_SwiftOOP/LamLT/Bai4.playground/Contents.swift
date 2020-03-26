import UIKit

class TriganlePitago {
    var triganle = [Int]()

    init(triganle: [Int]) {
        self.triganle = triganle
    }

    func maxNumberArray(arrayInput: [Int]) -> Int {
        let instaneOfInputArray = arrayInput
        var max = instaneOfInputArray[0]
        for i in 0..<instaneOfInputArray.count {
            if max < instaneOfInputArray[i] {
                max = instaneOfInputArray[i]
            }
        }
        return max
    }

    func checkTriganle(t: TriganlePitago) -> [Int] {
        var instaneOfTriArray = t.triganle
        var sum: Int = 0
        let instaneMaxNumber = maxNumberArray(arrayInput: instaneOfTriArray)
        for i in 0..<instaneOfTriArray.count {
            if instaneOfTriArray[i] < instaneMaxNumber {
                sum = sum + instaneOfTriArray[i] * instaneOfTriArray[i]
            }
        }
        print(sum)
        print(instaneMaxNumber)
        if sum == instaneMaxNumber * instaneMaxNumber {
            print("Triganle \(instaneOfTriArray) is Pitago")
        } else {
            print("Triganle \(instaneOfTriArray) is Not Pitago")
            instaneOfTriArray = []
        }
        return instaneOfTriArray
    }
}
let tri1 = TriganlePitago(triganle: [5,4,2])
let q = tri1.checkTriganle(t: tri1)
print(q)
