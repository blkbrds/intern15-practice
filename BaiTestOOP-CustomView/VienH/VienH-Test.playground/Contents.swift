import UIKit

class LaoDong {
    var hoTen: String
    var tuoi: Int
    var gioiTinh: Bool
    var diaChi: String
    var soDienThoai: Double


    init(hoTen: String, tuoi: Int, gioiTinh: Bool, diaChi: String, soDienThoai: Double) {
        self.hoTen = hoTen
        self.tuoi = tuoi
        self.gioiTinh = gioiTinh
        self.diaChi = diaChi
        self.soDienThoai = soDienThoai
    }
    func inThongTin() {
        print("\tHo ten: \(self.hoTen)")
        print("\tTuoi: \(self.tuoi)")
        print("\tGioi tinh: \(self.gioiTinh == true ? "Nam" : "Nu")")
        print("\tDia Chi: \(self.diaChi)")
    }
}

final class CongNhan: LaoDong {
    var capBac: String

    init(hoten: String, tuoi: Int, gioiTinh: Bool, diaChi: String, soDienThoai: Double, capBac: String) {
        self.capBac = capBac
        super.init(hoTen: hoten, tuoi: tuoi, gioiTinh: gioiTinh, diaChi: diaChi, soDienThoai: soDienThoai)
    }
}

final class KySu: LaoDong {
    var nganhDaoTao: String

    init(hoTen: String, tuoi: Int, gioiTinh: Bool, diaChi: String, soDienThoai: Double, nganhDaoTao: String) {
        self.nganhDaoTao = nganhDaoTao
        super.init(hoTen: hoTen, tuoi: tuoi, gioiTinh: gioiTinh, diaChi: diaChi, soDienThoai: soDienThoai)
    }
}

final class NhanVien: LaoDong {
    var congViec: String

    init(hoTen: String, tuoi: Int, gioiTinh: Bool, diaChi: String, soDienThoai: Double, congViec: String) {
        self.congViec = congViec
        super.init(hoTen: hoTen, tuoi: tuoi, gioiTinh: gioiTinh, diaChi: diaChi, soDienThoai: soDienThoai)
    }
}

final class QLCB {
    func themCongNhan() -> CongNhan {
        let congNhan = CongNhan (hoten: "HoangVien", tuoi: 20, gioiTinh: true, diaChi: "DaNang", soDienThoai: 1, capBac: "congnhan")
        return congNhan
    }

    func themKySu() -> KySu {
        let kySu = KySu (hoTen: "HoangVien", tuoi: 20, gioiTinh: true, diaChi: "DaNang", soDienThoai: 2, nganhDaoTao: "Cui")
        return kySu
    }

    func themNhanVien() -> NhanVien {
        let nhanVien = NhanVien(hoTen: "HoangVien", tuoi: 20, gioiTinh: true, diaChi: "DaNang", soDienThoai: 3, congViec: "vip")
        return nhanVien
    }
}



