import UIKit


func numberOfSubString(in str: String, subString: String) -> Int{
    let lengthSubStr = subString.count
    var count = 0
    for i in 0..<str.count - lengthSubStr {
        let firstIndex = str.index(str.startIndex, offsetBy: i)
        let lastIndex = str.index(firstIndex, offsetBy: lengthSubStr)
        if subString == str[firstIndex..<lastIndex] {
            count += 1
        }
    }
    return count
}
numberOfSubString(in: "abaaaabbbabababbaaabababa", subString: "ab")
