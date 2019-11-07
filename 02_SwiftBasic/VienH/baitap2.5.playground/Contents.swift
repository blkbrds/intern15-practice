import UIKit

func demSoChuoiCon(str1: String, str2 : String) -> Int {
  var count = 0
  let arrayA : [Character] = Array(str1)
  let arrayB : [Character] = Array(str2)
  for i in 0...arrayA.count - arrayB.count {
      if [Character](arrayA[i..<i + arrayB.count]) == arrayB {
          count = count + 1
      }
  }
  return count
}
print("số lần chuỗi con trong chuỗi mẹ là:")
