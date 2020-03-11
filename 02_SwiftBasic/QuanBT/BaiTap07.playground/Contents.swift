import UIKit

func replacesElements(input: Int, output: Int) {
    var arr = [1, 2, 1]
    for i in 0..<arr.count {
        if arr[i]==input {
            arr[i] = output
        }
    }
    print(arr)
}
replacesElements(input: 1, output: 3)
