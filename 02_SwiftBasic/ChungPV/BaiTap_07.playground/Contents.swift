import UIKit

func replaceArray(array: [Int], elemToReplace:Int,substitutionElem: Int) -> [Int]{
    var arr:[Int] = array
    for i in 0...arr.count-1 {
        if(arr[i] == elemToReplace){
            arr[i] = substitutionElem
        }
    }
    return arr
    
}
var sobandau:Int = 1
var sothaythe:Int = 3
var mang:[Int] = [1,2,1]
var mangdathaythe:[Int]?
mangdathaythe = replaceArray(array: mang, elemToReplace: sobandau, substitutionElem: sothaythe)
print("Mang ban dau la: \(mang) \n Mang sau khi thay the la: \(mangdathaythe) ")
