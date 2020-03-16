import UIKit
func randomMang() {
    var arr : [Int] = []
    for i in 0...9 {
        arr.append(i)
    }
    arr.shuffle()
    print(arr)
}
randomMang()
