import UIKit
class NhanVienCongTy {
	var tenNhanVien: String
	var tuoiNhanVien: Int
	var gioiTinh: String
	var diaChi: String
	init(tenNhanVien: String, tuoiNhanVien: Int, gioiTinh: String, diaChi: String) {
		self.tenNhanVien = tenNhanVien
		self.tuoiNhanVien = tuoiNhanVien
		self.gioiTinh = gioiTinh
		self.diaChi = diaChi
	}
}

class KySu: NhanVienCongTy {
	var chuyenNganh: String
	init(tenNhanVien: String, tuoiNhanVien: Int, gioiTinh: String, diaChi: String, chuyenNganh : String) {
		self.chuyenNganh = chuyenNganh
		super.init(tenNhanVien: tenNhanVien, tuoiNhanVien: tuoiNhanVien, gioiTinh: gioiTinh, diaChi: diaChi			)
	}
}

class CongNhan: NhanVienCongTy {
	var capBac: Int
	init(tenNhanVien: String, tuoiNhanVien: Int, gioiTinh: String, diaChi: String, capBac: Int) {
		self.capBac = capBac
		super.init(tenNhanVien: tenNhanVien, tuoiNhanVien: tuoiNhanVien, gioiTinh: gioiTinh, diaChi: diaChi)
	}
}

class NhanVien: NhanVienCongTy {
	var congViec: String
	init(tenNhanVien: String, tuoiNhanVien: Int, gioiTinh: String, diaChi: String, congViec: String) {
		self.congViec = congViec
		super.init(tenNhanVien: tenNhanVien, tuoiNhanVien: tuoiNhanVien, gioiTinh: gioiTinh, diaChi: diaChi)
	}
}

class QuanLyNhanSu  {
	func themCongnhan () -> CongNhan {
		let congNhan1 = CongNhan(tenNhanVien: "Hien", tuoiNhanVien: 31, gioiTinh: "nam", diaChi: "vu", capBac: 3)
		return congNhan1
	}
	func themKySu() -> KySu {
		let kySu1 = KySu(tenNhanVien: "Hie", tuoiNhanVien: 31, gioiTinh: "nu", diaChi: "gd", chuyenNganh: "xay dung")
		return kySu1
	}
	func themNhanVien() -> NhanVien {
		let nhanVien1 = NhanVien(tenNhanVien: "lan", tuoiNhanVien: 12, gioiTinh: "nam", diaChi: "bc", congViec: "lao cong")
		return nhanVien1
	}

}

