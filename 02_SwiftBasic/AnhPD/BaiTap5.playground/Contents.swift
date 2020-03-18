import UIKit

func timChuoiConTrongChuoiMe(str1: String,str2: String) -> Int{
    var dem: Int = 0
    let arr1 = Array(str1)
    let arr2 = Array(str2)
    for i in 0..<arr1.count {
        if arr2[0] == arr1[i] && arr2[1] == arr1[i+1] {
            dem = dem + 1
        }
    }
    return dem
}
timChuoiConTrongChuoiMe(str1: "ababababbaab", str2: "ab")
