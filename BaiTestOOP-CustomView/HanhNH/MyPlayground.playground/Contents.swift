import UIKit

class QLCB {
    var congNhan: [CongNhan]
    var kySu: [KySu]
    var nhanVien: [NhanVien]
    
    init(congNhan: [CongNhan], kySu: [KySu], nhanVien: [NhanVien]) {
        self.congNhan = congNhan
        self.kySu = kySu
        self.nhanVien = nhanVien
    }
}

class CongNhan {
    var id: Int
    var hoTenCN: String
    var tuoiCN: Int
    var gioiTinhCN: String
    var diaChiCN: String
    
    init(id: Int, hoten: String, tuoi: Int, gioiTinh: String, diaChi: String) {
        self.id = id
        self.hoTenCN = hoten
        self.tuoiCN = tuoi
        self.gioiTinhCN = gioiTinh
        self.diaChiCN = diaChi
    }
    
    func show() -> String {
        return "\(hoTenCN), \(tuoiCN), \(gioiTinhCN), \(diaChiCN)"
    }
}

class KySu {
    var id: Int
    var hoTenKS: String
    var tuoiKS: Int
    var gioiTinhKS: String
    var diaChiKS: String
    
    init(id: Int, hoten: String, tuoi: Int, gioiTinh: String, diaChi: String) {
        self.id = id
        self.hoTenKS = hoten
        self.tuoiKS = tuoi
        self.gioiTinhKS = gioiTinh
        self.diaChiKS = diaChi
    }
    
    func show() -> String {
        return "\(hoTenKS), \(tuoiKS), \(gioiTinhKS), \(diaChiKS)"
    }
}

class NhanVien {
    var id: Int
    var hoTenNV: String
    var tuoiNV: Int
    var gioiTinhNV: String
    var diaChiNV: String
    
    init(id: Int, hoten: String, tuoi: Int, gioiTinh: String, diaChi: String) {
        self.id = id
        self.hoTenNV = hoten
        self.tuoiNV = tuoi
        self.gioiTinhNV = gioiTinh
        self.diaChiNV = diaChi
    }
    
    func show() -> String {
        return "\(hoTenNV), \(tuoiNV), \(gioiTinhNV), \(diaChiNV)"
    }
}

class QuanLyDanhSachCanBo {
    var danhSachNhanVien: [NhanVien] = []
    var danhSachKySu: [KySu] = []
    var danhSachCongNhan: [CongNhan] = []
    
    init(congNhan: [CongNhan], kySu: [KySu], nhanVien: [NhanVien]) {
        self.danhSachKySu = kySu
        self.danhSachCongNhan = congNhan
        self.danhSachNhanVien = nhanVien
    }
    
    func themDanhSachCongNhan(congNhan: CongNhan) {
        danhSachCongNhan.append(congNhan)
    }
    
    func themDanhSachKySu(kySu: KySu) {
        danhSachKySu.append(kySu)
    }
    
    func themDanhSachNhanVien(nhanVien: NhanVien) {
         danhSachNhanVien.append(nhanVien)
    }
    
    func timKiemNhanVien(nameNV: String) -> Bool {
        for item in danhSachNhanVien {
            if item.hoTenNV == nameNV {
                return true
            } else {
                return false
            }
        }
        return false
    }
    
    func timKiemCongNhan(nameCN: String) -> Bool {
           for item in danhSachNhanVien {
               if item.hoTenNV == nameCN {
                   return true
               } else {
                   return false
               }
           }
           return false
       }
    
     func timKiemKySu(nameKS: String) -> Bool {
           for item in danhSachNhanVien {
               if item.hoTenNV == nameKS {
                   return true
               } else {
                   return false
               }
           }
           return false
       }
    
    func showNhanVien() {
        for i in danhSachNhanVien {
            i.show()
        }
    }
    
    func showKySu() {
        for y in danhSachKySu {
            y.show()
        }
    }
    
    func showCongNhan() {
        for z in danhSachCongNhan {
            z.show()
        }
    }
}

var congNhan = CongNhan(id: 1, hoten: "Hanh", tuoi: 22, gioiTinh: "nam", diaChi: "Camle")
var kySu = KySu(id: 1, hoten: "HanhKySu", tuoi: 22, gioiTinh: "nam", diaChi: "cach mang thang 8")
var nhanVien = NhanVien(id: 1, hoten: "hanhasdasd", tuoi: 22, gioiTinh: "nam", diaChi: "asdsaddasddasd")

var qlcb = QLCB(congNhan: [congNhan], kySu: [kySu], nhanVien: [nhanVien])
var quanlyCanBo = QuanLyDanhSachCanBo(congNhan: [congNhan], kySu: [kySu], nhanVien: [nhanVien])
quanlyCanBo.showKySu()
quanlyCanBo.showCongNhan()
quanlyCanBo.showNhanVien()
quanlyCanBo.themDanhSachCongNhan(congNhan: CongNhan(id: 2, hoten: "hanh", tuoi: 22, gioiTinh: "Nam", diaChi: "asdasdsdas"))
quanlyCanBo.themDanhSachKySu(kySu: KySu(id: 2, hoten: "hanheqe", tuoi: 33, gioiTinh: "Nam", diaChi: "asdasdsdas"))
quanlyCanBo.themDanhSachNhanVien(nhanVien: NhanVien(id: 3, hoten: "asdasd", tuoi: 22, gioiTinh: "nam", diaChi: "asddsaffeqf"))
