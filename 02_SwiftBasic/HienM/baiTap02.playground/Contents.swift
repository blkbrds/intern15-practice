import UIKit

enum KetQua {
	case haiNghiem(x1: Float,x2: Float)
	case motNghiem(x: Float)
	case vSNghiem
	case voNgiem
}
func phuongTrinhBac2 (a:Float , b :Float ,c:Float ) -> KetQua {
	if a == 0 {
		if b == 0 {
			if c == 0 {
				return .vSNghiem
			}
			else{
				return .voNgiem
			}
		}
		else {
			return .motNghiem(x: -b / c)
		}
	}
	else {
		let denta  = b * b - 4 * a * c
		if denta < 0 {
			return .voNgiem
		}
		else if denta == 0 {
			return .motNghiem(x: -b / 2 * a)
		}
		else {

			return .haiNghiem(x1: (-b - sqrt(denta) ) / (2 * a), x2: ( -b + sqrt(denta) / (2 * a)))
		}
	}
}
let tinhThu = phuongTrinhBac2(a: 7, b: 10, c: 1)
switch tinhThu {
	case .voNgiem :
		print("phuong trinh vo nghiem")
	case .haiNghiem( _, _):
		print("phuong trinh co 2 nghiem \(tinhThu)")
	case .motNghiem( _):
		print("phuong trinh co 1 nghiem \(tinhThu)")
	case .vSNghiem:
		print("phuong trinh co vo so nghiem ")
}
