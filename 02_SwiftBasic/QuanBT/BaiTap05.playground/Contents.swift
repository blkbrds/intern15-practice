import UIKit

func findString(string: String, substring: String) -> Int {
    let strings =  Array(string)
    let substrings = Array(substring)
    var count = 0, temp = 0, count2 = 0, result = 0
    while count < strings.count {
        temp = count
        var test = 0
        while count2 < substrings.count {
            if substrings[count2] == strings[temp] {
                test += 1
            }
            count2 += 1
            temp += 1
            if test == substrings.count {
                result += 1
            }
        }
        if count < strings.count - substrings.count {
            count2 = 0
        }
        count += 1
    }
    return result
}
print(findString(string: "aababaabaaabababaaab", substring: "ab"))
