import UIKit

class CanBo {
    var hoTen: String
    var tuoi: Int
    var gioiTinh: String
    var diaChi: String
    
    init(hoTen: String, tuoi: Int, gioiTinh: String, diaChi: String) {
        self.hoTen = hoTen
        self.tuoi = tuoi
        self.gioiTinh = gioiTinh
        self.diaChi = diaChi
    }
}

final class CongNhan: CanBo {
    var bac: Int
    
    init(hoTen: String, tuoi: Int, gioiTinh: String, diaChi: String, bac: Int) {
        self.bac = bac
        super.init(hoTen: hoTen, tuoi: tuoi, gioiTinh: gioiTinh, diaChi: diaChi)
    }
}

final class KySu: CanBo {
    var nganhDaoTao: String
    
    init(hoTen: String, tuoi: Int, gioiTinh: String, diaChi: String, nganhDaoTao: String) {
        self.nganhDaoTao = nganhDaoTao
        super.init(hoTen: hoTen, tuoi: tuoi, gioiTinh: gioiTinh, diaChi: diaChi)
    }
}

final class NhanVien: CanBo {
    var congViec: String
    
    init(hoTen: String, tuoi: Int, gioiTinh: String, diaChi: String, congViec: String) {
        self.congViec = congViec
        super.init(hoTen: hoTen, tuoi: tuoi, gioiTinh: gioiTinh, diaChi: diaChi)
    }
}

final class QLCB {
    var danhSachCanBo: [CanBo]

    init(danhSachCanBo: [CanBo]) {
        self.danhSachCanBo = danhSachCanBo
    }
    
    func themMoiCanBo(canBoMoi: CanBo) {
        self.danhSachCanBo.append(canBoMoi)
    }
    
    func timKiemTheoHoTen(tenCanBo: String) -> CanBo? {
        for index in 0..<danhSachCanBo.count {
            let firstStringLength: Int = danhSachCanBo[index].hoTen.count
            let secondStringLength: Int = tenCanBo.count
            if danhSachCanBo[index].hoTen.prefix(firstStringLength) == tenCanBo.prefix(secondStringLength) {
                return danhSachCanBo[index]
            }
        }
        return nil
    }
    
    func hienThiThongTin() -> [CanBo] {
        return danhSachCanBo
    }
}

let danhSachCanBo: [CanBo] = [CongNhan(hoTen: "Nguyễn Thế An", tuoi: 21, gioiTinh: "Nam", diaChi: "Tôn Đản", bac: 10), KySu(hoTen: "Lê Văn Thắng", tuoi: 21, gioiTinh: "Nam", diaChi: "Lâm Nhĩ", nganhDaoTao: "CNTT"), NhanVien(hoTen: "Trần Văn Tiến", tuoi: 22, gioiTinh: "Nam", diaChi: "Liên Chiểu", congViec: "Coder")]
let quanLy =  QLCB(danhSachCanBo: danhSachCanBo)
let canBoMoi = NhanVien(hoTen: "Duy", tuoi: 21, gioiTinh: "Nam", diaChi: "Ngô Quyền", congViec: "Coder")








