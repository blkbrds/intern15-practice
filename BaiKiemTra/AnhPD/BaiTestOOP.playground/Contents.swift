import UIKit

//Trắc nghiệm

//Câu 1: C

//Câu 2: B

//Câu 3: C

//Câu 4: A

//Câu 5: E

//Câu 6: A

class TaiLieu {
    var maTaiLieu: String
    var tenNhaXuatBan: String
    var soBanPhatHanh: String
    
    init(maTaiLieu: String, tenNhaXuatBan: String, soBanPhatHanh: String) {
        self.maTaiLieu = maTaiLieu
        self.tenNhaXuatBan = tenNhaXuatBan
        self.soBanPhatHanh = soBanPhatHanh
    }
}

class Sach: TaiLieu {
    var tenTacGia: String
    var soTrang: String
    
    init(maTaiLieu: String, tenNhaXuatBan: String, soBanPhatHanh: String, tenTacGia: String, soTrang: String) {
        self.tenTacGia = tenTacGia
        self.soTrang = soTrang
        super.init(maTaiLieu: maTaiLieu, tenNhaXuatBan: tenNhaXuatBan, soBanPhatHanh: soBanPhatHanh)
    }
}

class TapChi: TaiLieu {
    var soPhatHanh: Int
    var thangPhatHanh: String
    
    init(maTaiLieu: String, tenNhaXuatBan: String, soBanPhatHanh: String, soPhatHanh: Int, thangPhatHanh: String) {
        self.soPhatHanh = soPhatHanh
        self.thangPhatHanh = thangPhatHanh
        super.init(maTaiLieu: maTaiLieu, tenNhaXuatBan: tenNhaXuatBan, soBanPhatHanh: soBanPhatHanh)
    }
}

class Bao: TaiLieu {
    var ngayPhatHanh: String
    
    init(maTaiLieu: String, tenNhaXuatBan: String, soBanPhatHanh: String, ngayPhatHanh: String) {
        self.ngayPhatHanh = ngayPhatHanh
        super.init(maTaiLieu: maTaiLieu, tenNhaXuatBan: tenNhaXuatBan, soBanPhatHanh: soBanPhatHanh)
    }
}

class QuanLyTaiLieu {
    
    var taiLieuArr: [TaiLieu] = []
    
    func themMoi(taiLieu: [TaiLieu]) {
        self.taiLieuArr.append(contentsOf: taiLieu)
    }
    
    func xoaTaiLieu(maTaiLieu: String) {
        for i in 0..<taiLieuArr.count {
            if maTaiLieu == taiLieuArr[i].maTaiLieu {
                taiLieuArr.remove(at: i)
            }
        }
    }
    
    func hienThiThongTin() {
        for i in 0..<taiLieuArr.count {
            print("Ma tai lieu la: \(taiLieuArr[i].maTaiLieu) & Ten nha xuat ban la: \(taiLieuArr[i].tenNhaXuatBan) & So ban phat hanh la: \(taiLieuArr[i].soBanPhatHanh)")
        }
    }
    
    func timKiemTheoLoaiSach(maTaiLieu: String) {
        for i in 0..<taiLieuArr.count {
            if maTaiLieu == taiLieuArr[i].maTaiLieu {
                print("Ma tai lieu la: \(taiLieuArr[i].maTaiLieu) & Ten nha xuat ban la: \(taiLieuArr[i].tenNhaXuatBan) & So ban phat hanh la: \(taiLieuArr[i].soBanPhatHanh)")
            }
        }
    }
}

var sach = Sach(maTaiLieu: "01", tenNhaXuatBan: "duc anh", soBanPhatHanh: "20", tenTacGia: "duc anh", soTrang: "100")
var sach1 = Sach(maTaiLieu: "02", tenNhaXuatBan: "abc", soBanPhatHanh: "01", tenTacGia: "anc", soTrang: "200")
var qltl = QuanLyTaiLieu()
qltl.themMoi(taiLieu: [sach, sach1])
qltl.hienThiThongTin()
qltl.timKiemTheoLoaiSach(maTaiLieu: "01")
