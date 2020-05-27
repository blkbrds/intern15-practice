//import UIKit

func replaceArray(array: [Int], elemToReplace: Int, substitutionElem: Int) -> [Int]{
    var arr:[Int] = array
    for i in 0...arr.count - 1 {
        if arr[i] == elemToReplace {
            arr[i] = substitutionElem
        }
    }
    return arr
    
}
var soBanDau: Int = 1
var soThayThe: Int = 3
var mang: [Int] = [1,2,1]
var mangDaThayThe: [Int]?
mangDaThayThe = replaceArray(array: mang, elemToReplace: soBanDau, substitutionElem: soThayThe)
print("Mang ban dau la: \(mang) \n Mang sau khi thay the la: \(mangDaThayThe)")
