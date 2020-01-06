import UIKit

class PhanSo {
	var tuSo: Float
	var mauSo: Float

	init(tuso: Float, mauso: Float) {
		self.tuSo = tuso
		self.mauSo = mauso
	}

	func xuatPhanSo() -> String {
		return " \(tuSo) / \(mauSo)"
	}
}

extension PhanSo {

	static func + (left: PhanSo, right: PhanSo) -> PhanSo {
		let ketQuaTuSo = left.tuSo * right.mauSo + right.tuSo * left.mauSo
		let ketQuaMauSo = left.mauSo * right.mauSo
		return PhanSo(tuso: ketQuaTuSo, mauso: ketQuaMauSo)
	}
}

extension PhanSo {
		
	static func / (left: PhanSo, right: PhanSo) -> PhanSo {
		let ketQuaTuSo = left.tuSo * right.mauSo
		let ketQuaMauSo = left.mauSo * right.tuSo
		return PhanSo (tuso: ketQuaTuSo, mauso: ketQuaMauSo)
	}

}

var phanSo1 = PhanSo(tuso: 3, mauso: 4)
var phanSo2 = PhanSo(tuso: 5, mauso: 6)
var phanSo3 = PhanSo(tuso: 4, mauso: 2)
let kq: PhanSo = phanSo1 + phanSo2 + phanSo3
let kq2: PhanSo = phanSo1 / phanSo2 / phanSo3
print(kq.xuatPhanSo())
print(kq2.xuatPhanSo())

