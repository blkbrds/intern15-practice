import UIKit

enum GioiTinh {
    case nam
    case nu
}

class CanBo {
    var name: String
    var tuoi: Int
    var gioiTinh: GioiTinh
    var diaChi: String
    
    init(name: String, tuoi: Int, gioiTinh: GioiTinh, diaChi: String) {
        self.name = name
        self.gioiTinh = gioiTinh
        self.tuoi = tuoi
        self.diaChi = diaChi
    }
    
    func show() -> String {
        return "name: \(name),tuoi:  \(tuoi), gioiTinh: \(gioiTinh)"
    }
}

class CongNhan: CanBo {
    var bac: Int
    
    init(bac: Int, name: String, tuoi: Int, gioiTinh: GioiTinh, diaChi: String) {
        self.bac = bac
        super.init(name: name, tuoi: tuoi, gioiTinh: gioiTinh, diaChi: diaChi)
    }
    
    override func show() -> String {
       
        return "bac: \(bac), \(super.show()) "
    }
}

class KySu: CanBo {
    var nganhDaoTao: String
    
    init(name: String, tuoi: Int, gioiTinh: GioiTinh, diaChi: String, nganhDaoTao: String) {
        self.nganhDaoTao = nganhDaoTao
        super.init(name: name, tuoi: tuoi, gioiTinh: gioiTinh, diaChi: diaChi)
    }
    
    override func show() -> String {
                
        return "nganhDaoTao: \(nganhDaoTao), \(super.show())"
    }
}

class NhanVien: CanBo {
    var congViec: String
    
    init(name: String, tuoi: Int, gioiTinh: GioiTinh, diaChi: String, congViec: String) {
        self.congViec = congViec
        super.init(name: name, tuoi: tuoi, gioiTinh: gioiTinh, diaChi: diaChi)
    }
    
    override func show() -> String {
        return "congViec: \(congViec), \(super.show())"
    }
}

class QuanLyCanBo {
    
    var danhSachNhanVien: [NhanVien]
    var danhSachKySu: [KySu]
    var danhSachCongNhan: [CongNhan]
    
    init(danhSachNhanVien: [NhanVien], danhSachKySu: [KySu], danhSachCongNhan: [CongNhan]) {
        self.danhSachKySu = danhSachKySu
        self.danhSachCongNhan = danhSachCongNhan
        self.danhSachNhanVien = danhSachNhanVien
    }
    
    func themNhanVien(nhanVien: NhanVien) {
        danhSachNhanVien.append(nhanVien)
    }
    
    func themCongNhan(congNhan: CongNhan) {
        danhSachCongNhan.append(congNhan)
    }
    
    func themKySu(kySu: KySu) {
        danhSachKySu.append(kySu)
    }
    
    func timKiem(name: String) -> Bool {
        for item in danhSachCongNhan {
            if item.name == name {
                print("tìm kiếm là có: \(item.show())")
                return true
            } else {
                return false
            }
        }
        return false
    }
    
    func show()  {
        for item in danhSachNhanVien {
            print(item.show())
        }
        
        for item2 in danhSachCongNhan {
            print(item2.show())
        }
        
        for item3 in danhSachKySu {
            print(item3.show())
        }
    }
}

let congNhan = [CongNhan(bac: 1, name: "Hanh", tuoi: 19, gioiTinh: GioiTinh.nam, diaChi: "asddwddwdwqdw"), CongNhan(bac: 2, name: "Hanh2", tuoi: 12, gioiTinh: GioiTinh.nu, diaChi: "Da Nang")]
let nhanVien = [NhanVien(name: "AnhHai", tuoi: 23, gioiTinh: GioiTinh.nam, diaChi: "Da Nang", congViec: "sdsadasddsadasdd"), NhanVien(name: "AnhHai", tuoi: 23, gioiTinh: GioiTinh.nam, diaChi: "Da Nang", congViec: "sdsadasddsadasdd"), NhanVien(name: "AnhHai", tuoi: 23, gioiTinh: GioiTinh.nam, diaChi: "Da Nang", congViec: "sdsadasddsadasdd")]
let kySu = [KySu(name: "AnhHai", tuoi: 22, gioiTinh: GioiTinh.nam, diaChi: "Da Nang", nganhDaoTao: "CNTT"), KySu(name: "AnhHai", tuoi: 22, gioiTinh: GioiTinh.nam, diaChi: "Da Nang", nganhDaoTao: "CNTT"), KySu(name: "AnhHai", tuoi: 22, gioiTinh: GioiTinh.nam, diaChi: "Da Nang", nganhDaoTao: "CNTT")]

let quanLyCanBo = QuanLyCanBo(danhSachNhanVien: nhanVien, danhSachKySu: kySu, danhSachCongNhan: congNhan)
quanLyCanBo.themCongNhan(congNhan: CongNhan(bac: 2, name: "Nguyen Hong Hanh", tuoi: 18, gioiTinh: GioiTinh.nam, diaChi: "Da Nang"))
print(quanLyCanBo.timKiem(name: "Hanh"))
quanLyCanBo.show()
