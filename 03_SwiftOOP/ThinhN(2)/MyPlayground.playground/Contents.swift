import UIKit

//Tạo lớp Người với các thuộc tính cơ bản như tên, ngày sinh, tuổi (tuổi được tính từ ngày sinh và ngày hiện tại), phương thức là hoạt động. Yêu cầu tạo 1 đối tượng thuộc lớp Người có tên là “Nguyễn Văn A”, ngày sinh là 1/1/1988. In ra tuổi của đối tương này
//class Nguoi {
//    var ten: String
//    var ngaySinh: String
//    var tuoi: Int {
//        get {
//            let ngay = ngaySinh.split(separator: "/")
//            print(ngay)
//            let nam = Int(String(ngay[2])) ?? 0
//            return 2020 - nam
//        }
//    }
//    init (ten: String, ngaySinh: String) {
//        self.ten = ten
//        self.ngaySinh = ngaySinh
//    }
//    func hoatDong() {
//        print("Hoat dong ")
//    }
//}
//class GiaoVien: Nguoi {
//    var boMon: String
//    init(ten: String, ngaySinh: String, boMon: String) {
//        self.boMon = boMon
//        super.init(ten: ten, ngaySinh: ngaySinh)
//    }
//    override func hoatDong() {
//        print("Giang day")
//    }
//}
//
//class HocSinh: Nguoi {
//    var lop: String
//    init(ten: String, ngaySinh: String, lop: String) {
//        self.lop = lop
//        super.init(ten: ten, ngaySinh: ngaySinh)
//    }
//    override func hoatDong() {
//        print("Hoc tap ")
//    }
//}
//var a = Nguoi(ten: "X", ngaySinh: "20/02/2002")
//a.hoatDong()

//class SoPhuc {
//    var phanThuc: Int
//    var phanAo: Int
//    init(phanThuc: Int, phanAo: Int) {
//        self.phanThuc = phanThuc
//        self.phanAo = phanAo
//    }
//    func hienSoPhuc() {
//        print("\(phanThuc) + \(phanAo)i")
//    }
//    func congSoPhuc(a: Int, b: Int) {
//        let giaTriA = phanThuc + a
//        let giaTriB = phanAo + b
//        print("\(giaTriA) + \(giaTriB)i")
//    }
//    func nhanSoPhuc(a: Int, b: Int) {
//        let giaTriA = phanThuc * a  - b * phanAo
//        let giaTriB = (phanThuc * b + a * phanAo)
//        print("\(giaTriA) + \(giaTriB)i")
//    }
//}
//var soNhap = SoPhuc(phanThuc: 3, phanAo: 2)
//soNhap.hienSoPhuc()
//soNhap.congSoPhuc(a: 4, b: -2)
//soNhap.nhanSoPhuc(a: 1, b: -1)

//class ThiSinh {
//    var ma: Int
//    var ten: String
//    var ngayThangNamSinh: String
//    var diemToan: Int
//    var diemVan: Int
//    var diemAnh: Int
//    init(ma: Int, ten: String, ngayThangNamSinh: String, diemToan: Int, diemVan: Int, diemAnh: Int){
//        self.ma = ma
//        self.ten = ten
//        self.ngayThangNamSinh = ngayThangNamSinh
//        self.diemToan = diemToan
//        self.diemAnh = diemAnh
//        self.diemVan = diemVan
//    }
//    func tongDiem() -> Int {
//        let tongSoDiem = diemToan + diemVan + diemAnh
//        return tongSoDiem
//    }
//    func inThongTin() {
//        print("\(ma) \(ten) \(ngayThangNamSinh) \(diemToan) \(diemVan) \(diemAnh)")
//    }
//}
//class KiemTraThiSinh {
//    var cacThiSinh: [ThiSinh]
//    init(cacThiSinh: [ThiSinh]) {
//        self.cacThiSinh = cacThiSinh
//    }
//    func kiemTra() {
//        for i in cacThiSinh {
//            if i.tongDiem() > 15 {
//                i.inThongTin()
//            }
//        }
//    }
//}
//var a = ThiSinh(ma: 2, ten: "ff", ngayThangNamSinh:
//    "22/4/24", diemToan: 5, diemVan: 6, diemAnh: 8)
//var b = ThiSinh(ma: 3, ten: "faf", ngayThangNamSinh: "14/4/22", diemToan: 4, diemVan: 6, diemAnh: 7)
//var danhSach = KiemTraThiSinh(cacThiSinh: [ThiSinh(ma: 1, ten: "LeVanA", ngayThangNamSinh: "22/2/2002", diemToan: 5, diemVan: 4, diemAnh: 5), ThiSinh(ma: 2, ten: "TranBa", ngayThangNamSinh: "22/5/2014", diemToan: 8, diemVan: 8, diemAnh: 6)])
//danhSach.kiemTra()

//class Dictionary {
//    var duLieuNhap: [String: Int]
//    init(duLieuNhap: [String: Int]) {
//        self.duLieuNhap = duLieuNhap
//    }
//    func khoiTao() {
//        print(duLieuNhap)
//    }
//    func kiemTraSoNguyenTo(soNhap: Int) -> Bool {
//        if soNhap == 2 {
//            return true
//        }
//        if soNhap == 1 {
//                  return false
//              }
//        for i in 1..<soNhap - 1 {
//            print(soNhap)
//            if soNhap % i == 0 {
//                return false
//            }
//        }
//        return true
//    }
//    func kiemTra() ->Bool  {
//        for (_,value) in duLieuNhap where kiemTraSoNguyenTo(soNhap: value) == true {
//            return true
//        }
//        return false
//    }
//}
//var duLieu = Dictionary(duLieuNhap: ["TranVanA": 5])
//duLieu.kiemTra()
//duLieu.kiemTraSoNguyenTo(soNhap: 2)



//class ThiSinh {
//    var soBaoDanh: Int
//    var hoTen: String
//    var diaChi: String
//    var mucUuTien: Int
//    init (soBaoDanh: Int, hoTen: String, diaChi: String, mucUuTien: Int) {
//        self.soBaoDanh = soBaoDanh
//        self.hoTen = hoTen
//        self.diaChi = diaChi
//        self.mucUuTien = mucUuTien
//    }
//    func thiSinh(a: ThiSinh) -> ThiSinh {
//        print(a)
//        return(a)
//    }
//
//}
//class TuyenSinh {
//    var thiSinh: [ThiSinh]
//
//    init(thiSinh: [ThiSinh]) {
//        self.thiSinh = thiSinh
//    }
//    func themThiSinh(thiSinhThem: ThiSinh) {
//        thiSinh.append(thiSinhThem)
//    }
//    func hienThongTin() {
//        for i in thiSinh {
//            print("Hoc sinh \(i.hoTen) so bao danh \(i.soBaoDanh) o dia chi \(i.diaChi)" )
//        }
//    }
//    func timKiem(nhapSoBaoDanh: Int) {
//        for i in thiSinh {
//            if i.soBaoDanh == nhapSoBaoDanh {
//                print("\(i.hoTen) co so bao danh \(i.soBaoDanh) o dia chi \(i.diaChi)")
//            }
//        }
//    }
//}
//var LeNam = ThiSinh(soBaoDanh: 12, hoTen: "LeNam", diaChi: "DaNang", mucUuTien: 1)
////LeNam.thiSinh(a: ThiSinh(soBaoDanh: 11, hoTen: "ff", diaChi: "ff", mucUuTien: 2))
//var b = TuyenSinh(thiSinh: [ThiSinh(soBaoDanh: 12, hoTen: "TranVanA", diaChi: "DaNang", mucUuTien: 1), ThiSinh(soBaoDanh: 13, hoTen: "TranVanB", diaChi: "DaNang", mucUuTien: 2)])
//b.themThiSinh(thiSinhThem: ThiSinh(soBaoDanh: 14, hoTen: "TranVanC", diaChi: "Hanoi", mucUuTien: 3))
//b.hienThongTin()
//b.timKiem(nhapSoBaoDanh: 144)
//class ThuVien {
//    var sach: String
//    var tapChi: String
//    var bao: String
//    init(sach: String, tapChi: String, bao: String ) {
//        self.sach = sach
//        self.tapChi = tapChi
//        self.bao = bao
//    }
//
//}

//class Nguoi {
//    var hoTen: String
//    var tuoi: Int
//    var soCMND: Int
//    var soNgayThue: Int
//    var loaiPhong: Character
//    init(hoTen: String, tuoi: Int, soCMND: Int, soNgayThue: Int, loaiPhong: Character) {
//        self.hoTen = hoTen
//        self.tuoi = tuoi
//        self.soCMND = soCMND
//        self.soNgayThue = soNgayThue
//        self.loaiPhong = loaiPhong
//    }
//    func thongTinCaNhan() {
//        print("Ho va ten: \(hoTen),tuoi: \(tuoi),so CMND: \(soCMND)")
//    }
//}
//class KhachSan {
//    var thongTinKhach: [Nguoi]
//    init(thongTinKhach: [Nguoi]) {
//        self.thongTinKhach = thongTinKhach
//    }
//    func quanLyKhachHang() {
//        for i in thongTinKhach {
//            i.thongTinCaNhan()
//        }
//    }
//    func themKhachHang(khachDuocThem: Nguoi) {
//        for i in thongTinKhach {
//            i.soCMND
//            thongTinKhach.append(i)
//            print(i.soCMND)
//        }
//    }
//    func xoaKhachHang(nhapCMND: Int) {
//        for item in 0..<thongTinKhach.count - 1 {
//            if thongTinKhach[item].soCMND == nhapCMND {
//                thongTinKhach.remove(at: item )
//            }
//            print(thongTinKhach[item].hoTen)
//        }
//    }
//    func tinhTien(nhapCMND: Int) {
//        var tongTien: Int = 0
//        for i in thongTinKhach {
//            if i.soCMND == nhapCMND {
//                switch i.loaiPhong {
//                case "A":
//                    tongTien = 500 * i.soNgayThue
//                case "B":
//                    tongTien = 300 * i.soNgayThue
//                default:
//                    tongTien = 100 * i.soNgayThue
//                }
//                print("Khach hang \(i.hoTen) phai tra so tien la \(tongTien)")
//            }
//        }
//    }
//}
//var a = KhachSan(thongTinKhach: [Nguoi(hoTen: "TranA", tuoi: 20, soCMND: 111, soNgayThue: 10, loaiPhong: "A"), Nguoi(hoTen: "TranB", tuoi: 21, soCMND: 222, soNgayThue: 2, loaiPhong: "A"), Nguoi(hoTen: "TranC", tuoi: 23, soCMND: 333, soNgayThue: 3, loaiPhong: "C")])
//a.quanLyKhachHang()
//a.tinhTien(nhapCMND: 333)
//a.xoaKhachHang(nhapCMND: 333)
//
//class KhachHang {
//    var hoTen: String
//    var soNha: Int
//    var maCongToDien: Int
//    var chiSoDienCu: Int
//    var chiSoDienMoi: Int
//    init(hoTen: String, soNha: Int, maCongToDien: Int, chiSoDienCu: Int, chiSoDienMoi: Int) {
//        self.hoTen = hoTen
//        self.soNha = soNha
//        self.maCongToDien = maCongToDien
//        self.chiSoDienCu = chiSoDienCu
//        self.chiSoDienMoi = chiSoDienMoi
//    }
//    func thongTin() {
//        print("Khach hang \(hoTen) so nha \(soNha) co ma cong to dien \(maCongToDien)")
//    }
//}
//class BienLai {
//    var khachHang: [KhachHang]
//    init(khachHang: [KhachHang]) {
//        self.khachHang = khachHang
//    }
//    func tinhTienDien() {
//        var soTienTra: Int
//        for i in khachHang {
//            soTienTra = (i.chiSoDienMoi - i.chiSoDienCu) * 5
//            print("So tien phai tra cua khach hang \(i.hoTen) la \(soTienTra)")
//        }
//    }
//    func themKhachHang(khachHangMoi: KhachHang) {
//
//    }
//
////    func tienPhaiThanhToan() {
////        var soTienTra: Int = 0
////        for i in khachHang {
////            if i.
////        }
////    }
//
//}
//var a = KhachHang(hoTen: "TranVanA", soNha: 1, maCongToDien: 12, chiSoDienCu: 14, chiSoDienMoi: 17)
//a.thongTin()
//var b = BienLai(khachHang: [KhachHang(hoTen: "TranVanA", soNha: 1, maCongToDien: 12, chiSoDienCu: 14, chiSoDienMoi: 17),KhachHang(hoTen: "TranVanB", soNha: 2, maCongToDien: 13, chiSoDienCu: 15, chiSoDienMoi: 20)])
//b.tinhTienDien()

class PhuongTien {
    var hangSanXuat: String
    var namSanXuat: Int
    var giaBan: Int
    var mauXe: String
    init(hangSanXuat: String, namSanXuat: Int, giaBan: Int, mauXe: String) {
        self.hangSanXuat = hangSanXuat
        self.namSanXuat = namSanXuat
        self.giaBan = giaBan
        self.mauXe = mauXe
    }
}
class OTo: PhuongTien {
    var soChoNgoi: Int
    var kieuDongCo: String
    init(soChoNgoi: Int, kieuDongCo: String, hangSanXuat: String, namSanXuat: Int, giaBan: Int, mauXe: String) {
        self.soChoNgoi = soChoNgoi
        self.kieuDongCo = kieuDongCo
        super.init(hangSanXuat: hangSanXuat, namSanXuat: namSanXuat, giaBan: giaBan, mauXe: mauXe)
    }
    func inThongTin() {
        print("Xe thuoc hang \(hangSanXuat) co mau xe: \(mauXe )")
    }
}
class XeMay: PhuongTien {
    var congSuat: String
    init(congSuat: String, hangSanXuat: String, namSanXuat: Int, giaBan: Int, mauXe: String) {
        self.congSuat = congSuat
        super.init(hangSanXuat: hangSanXuat, namSanXuat: namSanXuat, giaBan: giaBan, mauXe: mauXe)
    }
}
class XeTai: PhuongTien {
    var taiTrong: String
    init(taiTrong: String, hangSanXuat: String, namSanXuat: Int, giaBan: Int, mauXe: String) {
        self.taiTrong = taiTrong
        super.init(hangSanXuat: hangSanXuat, namSanXuat: namSanXuat, giaBan: giaBan, mauXe: mauXe)
    }
}
class QLPTGT {
    var danhSachOto: [OTo]
    var danhSachXeMay: [XeMay]
    var danhSachXeTai: [XeTai]
    init(danhSachOto: [OTo], danhSachXeMay: [XeMay], danhSachXeTai: [XeTai]) {
        self.danhSachOto = danhSachOto
        self.danhSachXeMay = danhSachXeMay
        self.danhSachXeTai = danhSachXeTai
    }
    func timPhuongTien(nhapHang: String, mau: String ) {
        
    }
}
var a = OTo(soChoNgoi: 4, kieuDongCo: "Lilanh", hangSanXuat: "Mazda", namSanXuat: 2010, giaBan: 15000, mauXe: "Den")
a.inThongTin()

//class GiaoVien {
//    var luongCung: Int
//    var luongThuong: Int
//    var tienPhat: Int
//    var luongThucLinh: Int {
//        get {
//            return luongCung + luongThuong - tienPhat
//        }
//    }
//    var hoTen: String
//    var tuoi: Int
//    var queQuan: String
//    var maSoGiaoVien: Int
//    init(hoTen: String, tuoi: Int, queQuan: String, maSoGiaoVien: Int, luongCung: Int, luongThuong: Int, tienPhat: Int) {
//        self.hoTen = hoTen
//        self.luongCung = luongCung
//        self.tuoi = tuoi
//        self.queQuan = queQuan
//        self.maSoGiaoVien = maSoGiaoVien
//        self.tienPhat = tienPhat
//        self.luongThuong = luongThuong
//    }
//    func hienThongTin() {
//        print("Ho va ten \(hoTen) co ma sinh vien la \(maSoGiaoVien) que quan \(queQuan) luong thuc linh la \(luongThucLinh)")
//    }
//}
//
//class Nguoi {
//    var quanLy: GiaoVien
//    init(quanLy: GiaoVien) {
//        self.quanLy = quanLy
//    }
//    func thongTin() {
//        print("Ho va ten \(quanLy.hoTen) co ma so giao vien \(quanLy.maSoGiaoVien)que quan  \(quanLy.queQuan)")
//    }
//}
//class CBNV {
//    var quanLyCacGiaoVien: [GiaoVien]
//    init(quanLyCacGiaoVien: [GiaoVien]) {
//        self.quanLyCacGiaoVien = quanLyCacGiaoVien
//    }
//    func themGiaoVien(giaoVienMoi: GiaoVien) {
//        quanLyCacGiaoVien.append(giaoVienMoi)
//    }
////    func xoaGiaoVien(nhapMa: Int) {
////        for i in 0..<quanLyCacGiaoVien.count {
////            if quanLyCacGiaoVien[i].maSoGiaoVien == nhapMa {
////                quanLyCacGiaoVien.remove(at: i)
////            }
////        }
////    }
//    func quanLy() {
//        for i in quanLyCacGiaoVien {
//            i.hienThongTin()
//        }
//    }
//    func xoaGiaoVien(nhapMa: Int) {
//        for i in 0 ..< quanLyCacGiaoVien.count {
//            if quanLyCacGiaoVien[i].maSoGiaoVien == nhapMa {
//                quanLyCacGiaoVien.remove(at: i)
//                print("faf \(quanLyCacGiaoVien[i].hoTen)")
//            }
//        }
//    }
//    func luongGV() {
//        for i in 0 ..< quanLyCacGiaoVien.count {
//            print("Luong thuc linh cua \(quanLyCacGiaoVien[i].hoTen) la \(quanLyCacGiaoVien[i].luongThucLinh)")
//        }
//    }
//}
//var a = Nguoi(quanLy: GiaoVien(hoTen: "Tran A", tuoi: 22, queQuan: "DaNang", maSoGiaoVien: 11, luongCung: 150, luongThuong: 12, tienPhat: 10))
//a.thongTin()
//var b = CBNV(quanLyCacGiaoVien: [GiaoVien(hoTen: "TranA", tuoi: 22, queQuan: "DaNang", maSoGiaoVien: 11, luongCung: 100, luongThuong: 19, tienPhat: 10), GiaoVien(hoTen: "TranB", tuoi: 23, queQuan: "QuangNam", maSoGiaoVien: 22, luongCung: 140, luongThuong: 14, tienPhat: 5)])
////b.quanLy()
//b.themGiaoVien(giaoVienMoi: GiaoVien(hoTen: "TranC", tuoi: 33, queQuan: "QuangNam", maSoGiaoVien: 33, luongCung: 144, luongThuong: 40, tienPhat: 6))
//b.themGiaoVien(giaoVienMoi: GiaoVien(hoTen: "TranD", tuoi: 30, queQuan: "HaNoi", maSoGiaoVien: 44, luongCung: 145, luongThuong: 55, tienPhat: 33))
//
////b.xoaGiaoVien(nhapMa: 11)
//b.quanLy()
//b.luongGV()
