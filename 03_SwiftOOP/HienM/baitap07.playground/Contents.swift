import UIKit
class HocSinh {
	var tenHocSinh: String
	var namSinh: Int
	var tongKet: Int
	init(tenHocSinh: String, namSinh: Int, tongKet: Int) {
		self.tenHocSinh = tenHocSinh.inHoaChuCaiDau()
		self.namSinh = namSinh
		self.tongKet = tongKet
	}
}

extension String {
	func inHoaChuCaiDau() -> String {
		let tenHocSinh: String = self
		return tenHocSinh.capitalized
	}
}

extension Array where Element: HocSinh {

	func sapXepHocSinh() -> [HocSinh] {
		let danhSachHocSinh: [HocSinh] = self
		let danhSach = danhSachHocSinh.sorted { (hocSinh1, hocSinh2) -> Bool in
			if hocSinh1.tongKet == hocSinh2.tongKet {
				return hocSinh1.namSinh < hocSinh2.namSinh
			}
			else {
				return hocSinh1.tongKet > hocSinh2.tongKet
			}
		}
		return danhSach
	}
}

var danhSachHocSinh: [HocSinh] = []
danhSachHocSinh.append(HocSinh(tenHocSinh: "Ngoc hien", namSinh: 32, tongKet: 2))
danhSachHocSinh.append(HocSinh(tenHocSinh: "Ac hien", namSinh: 31, tongKet: 4))
danhSachHocSinh.append(HocSinh(tenHocSinh: "voc hien", namSinh: 30, tongKet: 2))
danhSachHocSinh.sapXepHocSinh()
