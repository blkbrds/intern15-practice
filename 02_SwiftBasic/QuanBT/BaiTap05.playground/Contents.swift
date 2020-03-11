import UIKit

func findString(string: String, substring: String) -> Int{
    let arr1 =  Array(string)
    let arr2 = Array(substring)
    var count = 0, temp = 0, count2 = 0, result = 0
    while count < arr1.count {
        temp = count
        var test = 0
        while count2 < arr2.count {
            if(arr2[count2] == arr1[temp]) {
                test += 1
            }
            count2 += 1
            temp += 1
            if( test == arr2.count) {
                result += 1
            }
        }
        if(count < arr1.count - arr2.count) {
            count2 = 0
        }
        count += 1
    }
    return result
}
print(findString(string: "aababaabaaabababaaab", substring: "ab"))
