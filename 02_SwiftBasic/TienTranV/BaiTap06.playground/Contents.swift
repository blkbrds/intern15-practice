import UIKit

//Hoán vị random các phần tử trong mang
var arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
func randomArr<T>(array: [T]) -> [T] {
    return array.shuffled()
}
randomArr(array: arr)
