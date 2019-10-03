import UIKit

func demChuoi(str: String, str1: String) -> Int {
    var count = 0
    for i in 0...str.count - str1.count where str[str.index(str.startIndex, offsetBy: i)...str.index(str.startIndex, offsetBy: i + str1.count - 1)] == str1 {
        count = count + 1
    }
    return count
}
print(demChuoi(str: "abababababab", str1: "ab"))
