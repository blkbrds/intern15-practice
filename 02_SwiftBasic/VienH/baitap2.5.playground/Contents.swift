import UIKit

func demSoChuoiCon(str1: String, str2: String) -> Int {
    var Count = 0
    let arrayA: [Character] = Array(str1)
    let arrayB: [Character] = Array(str2)
    for i in 0...arrayA.count - arrayB.count {
        if [Character](arrayA[i..<i + arrayB.count]) == arrayB {
            Count = Count + 1
        }
    }
    return Count
}
print("số lần chuỗi con trong chuỗi mẹ là:")
