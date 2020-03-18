import UIKit

func replace() {
    var arr: [Int] = [1,2,1]
    for i in 0..<arr.count {
        if arr[i] == 1 {
            arr[i] = 3
        }
    }
    print(arr)
}
replace()

