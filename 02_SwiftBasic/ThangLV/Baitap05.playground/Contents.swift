import UIKit

func findSubstring(string: String, substring: String) -> Int {
    var index: Int = 0
    var sum: Int = 0
    for char in string {
        if substring.first == char {
            let startOfFoundCharacter = string.index(string.startIndex, offsetBy: index)
            let lengthOfFoundCharacter = string.index(string.startIndex, offsetBy: (substring.count + index))
            let range = startOfFoundCharacter..<lengthOfFoundCharacter
            if string.substring(with: range) == substring {
                sum += 1
            }
        }
        index += 1
    }
    return sum
}

let string = "Ever ever ever ever"
let substring = "er"
print(findSubstring(string: string, substring: substring))


