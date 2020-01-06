import UIKit

class DaGiac {
	var soCanhDaGiac: Int
	var arrayDaGiac: [Float]

	init(soCanhDaGiac: Int, arrayDaGiac: [Float]) {
		self.soCanhDaGiac = soCanhDaGiac
		self.arrayDaGiac = arrayDaGiac
	}

	func tinhChuVi() -> Float {
		var chuVi: Float = 0
		for n in 0..<soCanhDaGiac {
			chuVi += arrayDaGiac[n]
		}
		return Float(chuVi)
	}

	func cacCanhDaGiac() -> [String: Float] {
		var canhDaGiac = [String: Float]()
		for n in 0..<soCanhDaGiac {
			canhDaGiac["so canh \(n + 1)"] = arrayDaGiac[n]
		}
		return canhDaGiac
	}
}

class TamGiac: DaGiac {

	override init(soCanhDaGiac: Int, arrayDaGiac: [Float]) {
		super.init(soCanhDaGiac: 3, arrayDaGiac: [])

	}
	override func tinhChuVi() -> Float {

		var chuViTamGiac: Float = 0
		for i in 0..<soCanhDaGiac {
			chuViTamGiac += arrayDaGiac[i]
		}
		return chuViTamGiac
	}

	func dienTichTamGiac() -> Float {
		let a = arrayDaGiac[0]
		let b = arrayDaGiac[1]
		let c = arrayDaGiac[2]
		super.arrayDaGiac[3]
		let p = tinhChuVi() / 2
		let dienTich = sqrt (p * (p - a) * (p - b) * (p - c))
		return dienTich
	}
}
