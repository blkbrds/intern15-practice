import UIKit

func replacesElements(_ x :Int,_ y: Int ){
    var arr = [1,2,1]
    for i in 0..<arr.count {
        if(arr[i] == x){
            arr[i] = y
        }
    }
    print(arr)
}
replacesElements(1,3)
