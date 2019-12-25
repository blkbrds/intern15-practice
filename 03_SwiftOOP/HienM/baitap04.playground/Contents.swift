import UIKit
class TamGiac {
	var mangTamGiac: [Double] = []

	init(mangTamGiac: [Double]) {
		self.mangTamGiac = mangTamGiac
	}

	func Pitago(tamgiac: [Double]) -> Bool {
		let a = mangTamGiac[0]
		let b = mangTamGiac[1]
		let c = mangTamGiac[2]
		if pow((a), 2.0) + pow(b, 2.0) == pow(c, 2.0) || pow(c, 2.0) + pow(b, 2.0) == pow(a, 2.0) || pow(a, 2.0) + pow(c, 2.0) == pow(b, 2.0) {
			return true
		}
		else {
			return false
		}
	}

	func tamGiacPytago(in tamgiacs: [TamGiac]) {
		for tamgiac in tamgiacs where Pitago(tamgiac: mangTamGiac) {
			print(tamgiac.mangTamGiac)
		}
	}
}
