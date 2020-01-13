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
	init(tenNhanVien: String, tuoiNhanVien: Int, gioiTinh: String, diaChi: String, chuyenNganh: String) {
		self.chuyenNganh = chuyenNganh
		super.init(tenNhanVien: tenNhanVien, tuoiNhanVien: tuoiNhanVien, gioiTinh: gioiTinh, diaChi: diaChi)
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

class QuanLyNhanSu {
	var danhSachNhanVien: [NhanVien] = []
	var danhSachKySu: [KySu] = []
	var danhSachCongNhan: [CongNhan] = []
	init(congNhan: [CongNhan], kySu: [KySu], nhanVien: [NhanVien]) {
		self.danhSachKySu = kySu
		self.danhSachCongNhan = congNhan
		self.danhSachNhanVien = nhanVien
	}

	func themCongnhan (congNhan: CongNhan) {
		danhSachCongNhan.append(congNhan)
	}

	func themKySu(kySu: KySu) {
		danhSachKySu.append(kySu)
	}

	func themNhanVien(nhanVien: NhanVien) {
		danhSachNhanVien.append(nhanVien)
	}

	func timKiem (Ten: String) -> Bool {
		for i in danhSachNhanVien {
			if i.tenNhanVien == Ten {
				return true
			}
		}
		return false
	}
	func Show () {
		for i in danhSachNhanVien {
			print(" \(danhSachNhanVien[i])")
		}
	}
}
