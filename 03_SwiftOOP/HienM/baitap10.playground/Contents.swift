import UIKit

class A {
	var n : Int
	
	init(n : Int) {
		self.n = n
	}
	
	func total() -> Int {
		var x : Int = 0
		for r in 0..<n {
			x = x + r
		}
		return x
	}
}

let y = A(n: 5)
y.total()
