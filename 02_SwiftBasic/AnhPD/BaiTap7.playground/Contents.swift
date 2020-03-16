import UIKit

func replace(x: Int,y: Int){
    var arr: [Int] = [1,2,1]
    for i in 0..<arr.count {
        if arr[i] == x {
            arr[i] = y
        }
    }
    print(arr)
}
replace(x: 1,y: 3)
