import UIKit

class CanBo {
    var hoTen: String
    var tuoi: Int
    var gioiTinh: Bool
    var diaChi: String

    init(hoTen: String, tuoi: Int, gioiTinh: Bool, diaChi: String) {
        self.hoTen = hoTen
        self.tuoi = tuoi
        self.gioiTinh = gioiTinh
        self.diaChi = diaChi
    }

    func inThongTin() {
        print("\tHo ten: \(self.hoTen)")
        print("\tTuoi: \(self.tuoi)")
        print("\tGioi tinh: \((self.gioiTinh == true) ? "Nam" : "Nu")")
        print("\tDia Chi: \(self.diaChi)")
    }
}

final class CongNhan: CanBo {
    var capBac: Int

    init(hoTen: String, tuoi: Int, gioiTinh: Bool, diaChi: String, capBac: Int) {
        self.capBac = capBac
        super.init(hoTen: hoTen, tuoi: tuoi, gioiTinh: gioiTinh, diaChi: diaChi)
    }

    override func inThongTin() {
        super.inThongTin()
        print("\tCap Bac: \(self.capBac)")
    }
}

final class KySu: CanBo {
    var nganhDaoTao: String

    init(hoTen: String, tuoi: Int, gioiTinh: Bool, diaChi: String, nganhDaoTao: String) {
        self.nganhDaoTao = nganhDaoTao
        super.init(hoTen: hoTen, tuoi: tuoi, gioiTinh: gioiTinh, diaChi: diaChi)
    }

    override func inThongTin() {
        super.inThongTin()
        print("\tNganh Dao Tao: \(self.nganhDaoTao)")
    }
}

final class NhanVien: CanBo {
    var congViec: String

    init(hoTen: String, tuoi: Int, gioiTinh: Bool, diaChi: String, congViec: String) {
        self.congViec = congViec
        super.init(hoTen: hoTen, tuoi: tuoi, gioiTinh: gioiTinh, diaChi: diaChi)
    }

    override func inThongTin() {
        super.inThongTin()
        print("\tCong Viec: \(self.congViec)")
    }
}

final class QLCB {
    var danhSachCanBo: [CanBo] = []

    func themCanBo() {
        let canBo = CanBo(hoTen: "Can Bo", tuoi: 10, gioiTinh: true, diaChi: "Da Nang")
        return danhSachCanBo.append(canBo)
    }

    func themCongNhan() {
        let congNhan = CongNhan(hoTen: "Cong Nhan", tuoi: 18, gioiTinh: true, diaChi: "Quang Nam", capBac: 5)
        return danhSachCanBo.append(congNhan)
    }

    func themKySu() {
        let kySu = KySu(hoTen: "Tran Van Tien", tuoi: 22, gioiTinh: true, diaChi: "Sai Gion", nganhDaoTao: "IT")
        return danhSachCanBo.append(kySu)
    }

    func themNhanVien() {
        let nhanVien = NhanVien(hoTen: "Nhan Vien", tuoi: 35, gioiTinh: true, diaChi: "NewYork", congViec: "Bu xe rac")
        return danhSachCanBo.append(nhanVien)
    }

    func hienThiDanhSachCanBo() {
        print("--------------Danh Sach Can Bo--------------")
        for (i, canBo) in danhSachCanBo.enumerated() {
            print("Can bo thu \(i + 1)")
            if canBo is NhanVien {
                (canBo as! NhanVien).inThongTin()
            } else if canBo is KySu {
                (canBo as! KySu).inThongTin()
            } else if canBo is CongNhan {
                (canBo as! CongNhan).inThongTin()
            } else {
                canBo.inThongTin()
            }
        }
    }

    func timKiemTheoTen(ten: String) {
        for (i, canBo) in danhSachCanBo.enumerated() {
            if canBo.hoTen == ten {
                print("Thong tin can bo can tim la: ")
                canBo.inThongTin()
                break
            }
        }
    }
}


var quanLy = QLCB()

quanLy.themCanBo()
quanLy.themCongNhan()
quanLy.themKySu()
quanLy.themNhanVien()
quanLy.timKiemTheoTen(ten: "Tran Van Tien")
quanLy.hienThiDanhSachCanBo()


