import UIKit

class Mang1c {
	var arrayInteger: [Int]

	init(arrayInteger: [Int]) {
		self.arrayInteger = arrayInteger
	}

	func printArrayInteger() {
		for i in 0..<arrayInteger.count {
			print("\(arrayInteger[i])")
		}
	}

	func maxAndMinInteger() -> (max: Int, min: Int) {
		let max = arrayInteger.max()
		let min = arrayInteger.min()
		return (max ?? 0, min ?? 0)
	}
}

let mang = Mang1c(arrayInteger: [1, 2, 3, 3, 4, 5, 3, 5,])
mang.maxAndMinInteger()
mang.printArrayInteger()

