import UIKit
class HinhVe {
	func dienTich() -> String {
		return "Dien tich"
	}
	func chuVi() -> String {
		return "Chu vi"
	}
	func theTich() -> String {
		return "The tich"
	}
}

class HaiChieu: HinhVe {
	
}

class BaChieu: HinhVe {
	
}

class Tron: HaiChieu {
	override func dienTich() -> String {
		return "Dien tich hinh tron"
	}
	override func chuVi() -> String {
		return "Chu vi hinh tron"
	}
	override func theTich() -> String {
		return "The tich hinh tron"
	}
}

class Vuong: HaiChieu {
	
}

class TamGiac: HaiChieu {
	
}

class Cau : BaChieu {
	
}

class LapPhuong : BaChieu {
	
}

