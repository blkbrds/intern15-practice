import UIKit

class Stack<Element> {

	fileprivate var array: [Element] = []
	func stackRong() -> Bool {
		return self.array.isEmpty
	}
	func kiemTraDay(phanTuToiDa: Int) -> Bool {
		return self.array.count >= phanTuToiDa - 1 ? true : false
	}
	func push(phanTuMoi: Element) {
		return array.append(phanTuMoi)
	}
	func pop() -> Element? {
		return array.popLast()
	}
	func count() -> Int {
		return array.count
	}
}

var stack = Stack<Int>()
stack.push(phanTuMoi: 34)
stack.push(phanTuMoi: 24)
stack.push(phanTuMoi: 24)
