import UIKit
func myArray(array: [Int]) {
	var newArray = array
	for i in 0..<newArray.count {
		if newArray[i] == 4 {
			newArray[i] = 5
		}
	}
	print(newArray)
}
let mang: [Int] = [1, 2, 5, 4, 5, 6, 7, 8]
myArray(array: mang)

