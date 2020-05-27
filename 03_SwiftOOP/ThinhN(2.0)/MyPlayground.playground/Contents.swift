import UIKit

//Tạo lớp Người với các thuộc tính cơ bản như tên, ngày sinh, tuổi (tuổi được tính từ ngày sinh và ngày hiện tại), phương thức là hoạt động. Yêu cầu tạo 1 đối tượng thuộc lớp Người có tên là “Nguyễn Văn A”, ngày sinh là 1/1/1988. In ra tuổi của đối tương này
//class Nguoi {
//    var ten: String
//    var ngaySinh: String
//    var tuoi: Int {
//        get {
//            let ngay = ngaySinh.split(separator: "/")
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
// Bai 1
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
//// Bai 2
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
//var thiSinh = ThiSinh(ma: 2, ten: "ff", ngayThangNamSinh:
//    "22/4/24", diemToan: 5, diemVan: 6, diemAnh: 8)
//var b = ThiSinh(ma: 3, ten: "faf", ngayThangNamSinh: "14/4/22", diemToan: 4, diemVan: 6, diemAnh: 7)
//var danhSach = KiemTraThiSinh(cacThiSinh: [ThiSinh(ma: 1, ten: "LeVanA", ngayThangNamSinh: "22/2/2002", diemToan: 5, diemVan: 4, diemAnh: 5), ThiSinh(ma: 2, ten: "TranBa", ngayThangNamSinh: "22/5/2014", diemToan: 8, diemVan: 8, diemAnh: 6)])
//danhSach.kiemTra()
// bai3
//class Dictionary {
//    var key: String
//    var value: Int
//    init(key: String, value: Int) {
//        self.key = key
//        self.value = value
//    }
//    func hienThongTin() {
//        print("Key \(key) va gia tri \(value)")
//    }
//    func kiemTraSoNguyenTo() -> Bool {
//        if value == 2 {
//            return true
//        }
//        if value == 1 {
//            return false
//        }
//        for i in 2..<value  {
//            if value % i == 0 {
//                return false
//            }
//        }
//        return true
//    }
//    func kiemTraSoHoanHao() -> Bool {
//        var soTam: Int = 0
//        for i in 1..<value {
//            if value % i == 0 {
//                soTam += i
//            }
//            if soTam == value {
//                return true
//            }
//        }
//        return false
//    }
//    func kiemTraSoChinhPhuong() -> Bool {
//        let i: Float = sqrt(Float((value)))
//        if i * i == Float(value) {
//            return true
//        }
//        return false
//    }
//
//}
//var duLieu = Dictionary(key: "kaa", value: 28)
//duLieu.hienThongTin()
//duLieu.kiemTraSoNguyenTo()
//duLieu.kiemTraSoHoanHao()
//duLieu.kiemTraSoChinhPhuong()
// -- Bai 4--
//class ThiSinh {
//    var soBaoDanh: Int
//    var hoTen: String
//    var diaChi: String
//    var mucUuTien: Int
//    var khoiThi: [KhoiThi]
//    init (soBaoDanh: Int, hoTen: String, diaChi: String, mucUuTien: Int, khoiThi: [KhoiThi]) {
//        self.soBaoDanh = soBaoDanh
//        self.hoTen = hoTen
//        self.diaChi = diaChi
//        self.mucUuTien = mucUuTien
//        self.khoiThi = khoiThi
//    }
//    func thongTin() {
//        print("Ho va ten thi sinh \(hoTen) co so bao danh \(soBaoDanh) o \(diaChi)")
//    }
//}
//class KhoiThi {
//    var monThi: String
//    var ten: String
//    init(monThi: String, ten: String) {
//        self.monThi = monThi
//        self.ten = ten
//    }
//}
//class TuyenSinh {
//    var thiSinh: [ThiSinh]
//    init(thiSinh: [ThiSinh]) {
//        self.thiSinh = thiSinh
//    }
//    func themThiSinh(thiSinhThem: ThiSinh) {
//        thiSinh.append(thiSinhThem)
//    }
//    func hienThongTin() {
//        for i in thiSinh {
//            var n: String = ""
//            for j in i.khoiThi {
//                n.append(j.ten)
//                n.append(",")
//            }
//            print("Hoc sinh \(i.hoTen) so bao danh \(i.soBaoDanh) o dia chi \(i.diaChi) khoi thi \(n)")
//        }
//    }
//    func timKiem(nhapSoBaoDanh: Int) {
//        for i in thiSinh {
//            if i.soBaoDanh == nhapSoBaoDanh {
//                i.thongTin()
//            }
//        }
//    }
//}
//var khoiA = KhoiThi(monThi: "Toan Ly Hoa", ten: "KhoiA")
//var khoiB = KhoiThi(monThi: "Toan Hoa Sinh", ten: "KhoiB")
//var khoiC = KhoiThi(monThi: "Van Su Dia", ten: "KhoiC")
//var b = TuyenSinh(thiSinh: [ThiSinh(soBaoDanh: 13, hoTen: "TranVanA", diaChi: "DaNang", mucUuTien: 1, khoiThi: [khoiA, khoiB])])
//b.themThiSinh(thiSinhThem: ThiSinh(soBaoDanh: 14, hoTen: "TranVanC", diaChi: "Hanoi", mucUuTien: 3, khoiThi: [khoiB, khoiC]))
//b.themThiSinh(thiSinhThem: ThiSinh(soBaoDanh: 15, hoTen: "TranVanD", diaChi: "Hanoi", mucUuTien: 2, khoiThi: [khoiC]))
//b.hienThongTin()
//b.timKiem(nhapSoBaoDanh: 14)
////Bai 5
class TaiLieu {
    var maTaiLieu: Int
    var tenNhaXuatBan: String
    var soBanPhatHanh: Int

    init(maTaiLieu: Int, tenNhaXuatBan: String, soBanPhatHanh: Int) {
        self.maTaiLieu = maTaiLieu
        self.tenNhaXuatBan = tenNhaXuatBan
        self.soBanPhatHanh = soBanPhatHanh
    }
    func thongTin() {
        print(" Ma tai lieu \(maTaiLieu) cua nha xuat ban \(tenNhaXuatBan) xuat ban \(soBanPhatHanh)")
    }
}
class Sach: TaiLieu {
    var tenTacGia: String
    var soTrang: Int
    init(maTaiLieu: Int, tenNhaXuatBan: String, soBanPhatHanh: Int, tenTacGia: String, soTrang: Int) {
        self.tenTacGia = tenTacGia
        self.soTrang = soTrang
        super.init(maTaiLieu: maTaiLieu, tenNhaXuatBan: tenNhaXuatBan, soBanPhatHanh: soBanPhatHanh)
    }
    override func thongTin() {
        print(" Ma tai lieu \(maTaiLieu) cua nha xuat ban \(tenNhaXuatBan) xuat ban \(soBanPhatHanh)")
    }
}
class TapChi: TaiLieu {
    var soPhatHanh: Int
    var thangPhatHanh: Int
    init(maTaiLieu: Int, tenNhaXuatBan: String, soBanPhatHanh: Int, soPhatHanh: Int, thangPhatHanh: Int) {
        self.soPhatHanh = soPhatHanh
        self.thangPhatHanh = thangPhatHanh
        super.init(maTaiLieu: maTaiLieu, tenNhaXuatBan: tenNhaXuatBan, soBanPhatHanh: soBanPhatHanh)
    }
    override func thongTin() {
        print(" Ma tai lieu \(maTaiLieu) cua nha xuat ban \(tenNhaXuatBan) xuat ban \(soBanPhatHanh)")
    }
}
class Bao: TaiLieu {
    var ngayPhatHanh: Int
    init(maTaiLieu: Int, tenNhaXuatBan: String, soBanPhatHanh: Int, ngayPhatHanh: Int) {
        self.ngayPhatHanh = ngayPhatHanh
        super.init(maTaiLieu: maTaiLieu, tenNhaXuatBan: tenNhaXuatBan, soBanPhatHanh: soBanPhatHanh)
    }
    override func thongTin() {
       print(" Ma tai lieu \(maTaiLieu) cua nha xuat ban \(tenNhaXuatBan) xuat ban \(soBanPhatHanh)")
    }
}
class ThuVien {
    var cacLoaiSach: [Sach]
    var cacLoaiTapChi: [TapChi]
    var cacLoaiBao: [Bao]
    init(cacLoaiSach: [Sach],cacLoaiTapChi: [TapChi], cacLoaiBao: [Bao]) {
        self.cacLoaiSach = cacLoaiSach
        self.cacLoaiBao = cacLoaiBao
        self.cacLoaiTapChi = cacLoaiTapChi
    }
    func themMoiSach(sachThem: Sach) {
        cacLoaiSach.append(sachThem)
    }
    func themMoiBao(baoThem: Bao) {
        cacLoaiBao.append(baoThem)
    }
    func themMoiTapChi(tapChiThem: TapChi) {
        cacLoaiTapChi.append(tapChiThem)
    }
    func xoaTaiLieu(nhapMaTaiLieu: Int) {
        cacLoaiSach.removeAll { (TaiLieu) -> Bool in
            TaiLieu.maTaiLieu == nhapMaTaiLieu
        }
        cacLoaiBao.removeAll { (TaiLieu) -> Bool in
        TaiLieu.maTaiLieu == nhapMaTaiLieu
        }
        cacLoaiTapChi.removeAll { (TaiLieu) -> Bool in
        TaiLieu.maTaiLieu == nhapMaTaiLieu
        }
    }
    func thongTin() {
        for i in cacLoaiSach {
            i.thongTin()
        }
        for i in cacLoaiTapChi {
            i.thongTin()
        }
        for i in cacLoaiBao {
            i.thongTin()
        }
    }
    func timKiemTaiLieu(nhapMaTaiLieu: Int, loaiTaiLieu: LoaiTaiLieu) {
        switch loaiTaiLieu {
        case.bao:
            for i in cacLoaiBao {
                if i.maTaiLieu == nhapMaTaiLieu {
                    print("\(i.tenNhaXuatBan) co \(i.maTaiLieu)")
                }
            }
        case.sach:
            for i in cacLoaiSach {
                if i.maTaiLieu == nhapMaTaiLieu {
                    print("\(i.tenNhaXuatBan) co \(i.maTaiLieu)")
                }
            }
        default:
            for i in cacLoaiTapChi {
                if i.maTaiLieu == nhapMaTaiLieu {
                    print("\(i.tenNhaXuatBan) co \(i.maTaiLieu)")
                }
            }
        }
    }
}
enum LoaiTaiLieu {
    case bao
    case sach
    case tapChi
}
var thuVien = ThuVien(cacLoaiSach: [Sach(maTaiLieu: 1, tenNhaXuatBan: "KimDong", soBanPhatHanh: 15, tenTacGia: "TranVanA", soTrang: 140)], cacLoaiTapChi: [TapChi(maTaiLieu: 12, tenNhaXuatBan: "TranAn", soBanPhatHanh: 123, soPhatHanh: 12, thangPhatHanh: 4)], cacLoaiBao: [Bao(maTaiLieu: 112, tenNhaXuatBan: "ThieuNien", soBanPhatHanh: 123, ngayPhatHanh: 14), Bao(maTaiLieu: 104, tenNhaXuatBan: "ThanhNien", soBanPhatHanh: 441, ngayPhatHanh: 21)])
thuVien.themMoiSach(sachThem: Sach(maTaiLieu: 4, tenNhaXuatBan: "HoaNam", soBanPhatHanh: 44, tenTacGia: "TranHuy", soTrang: 234))
thuVien.xoaTaiLieu(nhapMaTaiLieu: 12)
thuVien.thongTin()
thuVien.timKiemTaiLieu(nhapMaTaiLieu: 112, loaiTaiLieu: LoaiTaiLieu.bao)
//////Bai 6
//class Nguoi {
//    var hoTen: String
//    var tuoi: Int
//    var soCMND: Int
//    init(hoTen: String, tuoi: Int, soCMND: Int) {
//        self.hoTen = hoTen
//        self.tuoi = tuoi
//        self.soCMND = soCMND
//    }
//    func thongTinCaNhan() {
//        print("Ho va ten: \(hoTen),tuoi: \(tuoi),so CMND: \(soCMND)")
//    }
//}
//class KhachHang: Nguoi {
//    var soNgayThue: Int
//    var loaiPhong: String
//    init(soNgayThue: Int, loaiPhong: String, hoTen: String, tuoi: Int, soCMND: Int) {
//        self.loaiPhong = loaiPhong
//        self.soNgayThue = soNgayThue
//        super.init(hoTen: hoTen, tuoi: tuoi, soCMND: soCMND)
//    }
//}
//class KhachSan {
//    var thongTinKhach: [KhachHang]
//    init(thongTinKhach: [KhachHang]) {
//        self.thongTinKhach = thongTinKhach
//    }
//    func quanLyKhachHang() {
//        for i in thongTinKhach {
//            i.thongTinCaNhan()
//        }
//    }
//    func themKhachHang(khachDuocThem: KhachHang) {
//        thongTinKhach.append(khachDuocThem)
//    }
//    func xoaKhachHang(nhapCMND: Int) {
//        thongTinKhach.removeAll { (Nguoi) -> Bool in
//            Nguoi.soCMND == nhapCMND
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
//var khach = KhachSan(thongTinKhach: [KhachHang(soNgayThue: 2, loaiPhong: "A", hoTen: "TranVanB", tuoi: 20, soCMND: 112), KhachHang(soNgayThue: 3, loaiPhong: "B", hoTen: "TranVanA", tuoi: 22, soCMND: 111)])
//khach.themKhachHang(khachDuocThem: KhachHang(soNgayThue: 3, loaiPhong: "C", hoTen: "TranVanC", tuoi: 24, soCMND: 134))
//khach.themKhachHang(khachDuocThem: KhachHang(soNgayThue: 5, loaiPhong: "B", hoTen: "TranVanD", tuoi: 44, soCMND: 456))
//khach.xoaKhachHang(nhapCMND: 112)
//khach.quanLyKhachHang()
//khach.tinhTien(nhapCMND: 456)
////Bai 7
class KhachHang {
    var hoTen: String
    var soNha: Int
    var maCongToDien: Int
    init(hoTen: String, soNha: Int, maCongToDien: Int) {
        self.hoTen = hoTen
        self.soNha = soNha
        self.maCongToDien = maCongToDien
    }
    func thongTin() {
        print("Ho va ten \(hoTen) o so nha \(soNha) co ma cong to dien \(maCongToDien)")
    }
}
class BienLai {
    var chiSoDienCu: Int
    var chiSoDienMoi: Int
    var soTienPhaiTra: Int {
        return (chiSoDienMoi - chiSoDienCu) * 5
    }
    var khachHang: KhachHang
    init(khachHang: KhachHang, chiSoDienCu: Int, chiSoDienMoi: Int) {
        self.khachHang = khachHang
        self.chiSoDienCu = chiSoDienCu
        self.chiSoDienMoi = chiSoDienMoi
    }
    func inThongTin() {
        khachHang.thongTin()
    }
    func thanhToanTienDien() {
        print("Khach hang \(khachHang.hoTen) phai tra la \(soTienPhaiTra)")
    }
}
class QuanLy {
    var mangBienLai: [BienLai]
    var mangKhachHang: [KhachHang]
    init(mangBienLai: [BienLai], mangKhachHang: [KhachHang]) {
        self.mangBienLai = mangBienLai
        self.mangKhachHang = mangKhachHang
    }
    func inThongTin() {
        for i in mangBienLai {
            i.inThongTin()
        }
    }
    func thanhToanTienDien() {
        for i in mangBienLai {
            i.thanhToanTienDien()
        }
    }
    func themKhachHang(khachHangMoi: KhachHang) {
            mangKhachHang.append(khachHangMoi)
    }
    func xoaKhachHang(nhapMaCongToDien: Int) {
        mangKhachHang.removeAll { (KhachHang) -> Bool in
            KhachHang.maCongToDien == nhapMaCongToDien
        }
    }
    func suaThongTin(nhapMaCongToDien: Int, hoTen: String) {
        for i in mangKhachHang {
            if i.maCongToDien == nhapMaCongToDien {
                i.hoTen = hoTen
            }
        }
    }
}
var bienLai = QuanLy(mangBienLai: [BienLai(khachHang: KhachHang(hoTen: "Tran Van A", soNha: 15, maCongToDien: 45), chiSoDienCu: 675, chiSoDienMoi: 777), BienLai(khachHang: KhachHang(hoTen: "TranVanB", soNha: 16, maCongToDien: 46), chiSoDienCu: 677, chiSoDienMoi: 789)], mangKhachHang: [KhachHang(hoTen: "TranVanC", soNha: 14, maCongToDien: 566), KhachHang(hoTen: "TranVanD", soNha: 15, maCongToDien: 562)])
bienLai.thanhToanTienDien()
bienLai.inThongTin()
bienLai.themKhachHang(khachHangMoi: KhachHang(hoTen: "TranVanE", soNha: 34, maCongToDien: 422))
////// Bai 8
//class PhuongTien {
//    var hangSanXuat: String
//    var namSanXuat: Int
//    var giaBan: Int
//    var mauXe: String
//    init(hangSanXuat: String, namSanXuat: Int, giaBan: Int, mauXe: String) {
//        self.hangSanXuat = hangSanXuat
//        self.namSanXuat = namSanXuat
//        self.giaBan = giaBan
//        self.mauXe = mauXe
//    }
//}
//class OTo: PhuongTien {
//    var soChoNgoi: Int
//    var kieuDongCo: String
//    init(soChoNgoi: Int, kieuDongCo: String, hangSanXuat: String, namSanXuat: Int, giaBan: Int, mauXe: String) {
//        self.soChoNgoi = soChoNgoi
//        self.kieuDongCo = kieuDongCo
//        super.init(hangSanXuat: hangSanXuat, namSanXuat: namSanXuat, giaBan: giaBan, mauXe: mauXe)
//    }
//    func thongTin() {
//        print(" Oto: Hang san xuat \(hangSanXuat) gia ban \(giaBan) kieu dong co \(kieuDongCo) co mau xe \(mauXe) " )
//    }
//}
//class XeMay: PhuongTien {
//    var congSuat: String
//    init(congSuat: String, hangSanXuat: String, namSanXuat: Int, giaBan: Int, mauXe: String) {
//        self.congSuat = congSuat
//        super.init(hangSanXuat: hangSanXuat, namSanXuat: namSanXuat, giaBan: giaBan, mauXe: mauXe)
//    }
//    func thongTin() {
//        print(" Xe may: Hang san xuat \(hangSanXuat) gia ban \(giaBan) cong suat \(congSuat) co mau xe \(mauXe) ")
//    }
//}
//class XeTai: PhuongTien {
//    var taiTrong: String
//    init(taiTrong: String, hangSanXuat: String, namSanXuat: Int, giaBan: Int, mauXe: String) {
//        self.taiTrong = taiTrong
//        super.init(hangSanXuat: hangSanXuat, namSanXuat: namSanXuat, giaBan: giaBan, mauXe: mauXe)
//    }
//    func thongTin() {
//        print(" Xe tai: Hang san xuat \(hangSanXuat) gia ban \(giaBan) tai trong \(taiTrong) co mau xe \(mauXe) ")
//    }
//}
//class QLPTGT {
//    var danhSachOto: [OTo]
//    var danhSachXeMay: [XeMay]
//    var danhSachXeTai: [XeTai]
//    init(danhSachOto: [OTo], danhSachXeMay: [XeMay], danhSachXeTai: [XeTai]) {
//        self.danhSachOto = danhSachOto
//        self.danhSachXeMay = danhSachXeMay
//        self.danhSachXeTai = danhSachXeTai
//    }
//    func inThongTin() {
//        for i in danhSachOto {
//            i.thongTin()
//        }
//        for i in danhSachXeMay {
//            i.thongTin()
//        }
//        for i in danhSachXeTai {
//            i.thongTin()
//        }
//    }
//    func themOto(oToThem: OTo) {
//        danhSachOto.append(oToThem)
//    }
//    func themXeMay(xeMayThem: XeMay) {
//        danhSachXeMay.append(xeMayThem)
//    }
//    func themXeTai(xeTaiThem: XeTai) {
//        danhSachXeTai.append(xeTaiThem)
//    }
//    func timPhuongTien(hangCanTim: String, mauCanTim: String ) {
//        for i in 0..<danhSachOto.count {
//            if danhSachOto[i].hangSanXuat == hangCanTim && danhSachOto[i].mauXe == mauCanTim {
//                danhSachOto[i].thongTin()
//            }
//        }
//        for i in 0..<danhSachXeMay.count {
//            if danhSachXeMay[i].hangSanXuat == hangCanTim && danhSachXeMay[i].mauXe == mauCanTim {
//                danhSachXeMay[i].thongTin()
//            }
//        }
//        for i in 0..<danhSachXeTai.count {
//            if danhSachXeTai[i].hangSanXuat == hangCanTim && danhSachXeTai[i].mauXe == mauCanTim {
//                danhSachXeTai[i].thongTin()
//            }
//        }
//
//    }
//}
//
//var quanLy = QLPTGT(danhSachOto: [OTo(soChoNgoi: 4, kieuDongCo: "AB", hangSanXuat: "Mazda", namSanXuat: 2020, giaBan: 1500, mauXe: "Den")], danhSachXeMay: [XeMay(congSuat: "150cc", hangSanXuat: "Honda", namSanXuat: 2019, giaBan: 150, mauXe: "Cam")], danhSachXeTai: [XeTai(taiTrong: "2500kg", hangSanXuat: "Hyundai", namSanXuat: 2018, giaBan: 3400, mauXe: "Vang")])
//quanLy.themOto(oToThem: OTo(soChoNgoi: 4, kieuDongCo: "AA", hangSanXuat: "Toyota", namSanXuat: 2019, giaBan: 330, mauXe: "Xanh"))
//quanLy.themOto(oToThem: OTo(soChoNgoi: 3, kieuDongCo: "bb", hangSanXuat: "Suzuki", namSanXuat: 2020, giaBan: 333, mauXe: "Cam"))
//quanLy.themXeMay(xeMayThem: XeMay(congSuat: "125cc", hangSanXuat: "Yamaha", namSanXuat: 2018, giaBan: 255, mauXe: "Vang"))
//quanLy.themXeTai(xeTaiThem: XeTai(taiTrong: "4459kg", hangSanXuat: "Fortuner", namSanXuat: 2005, giaBan: 34445, mauXe: "Den"))
//quanLy.inThongTin()
//quanLy.timPhuongTien(hangCanTim: "Toyota", mauCanTim: "Xanh")
//quanLy.timPhuongTien(hangCanTim: "Fortuner", mauCanTim: "Den")
//quanLy.inThongTin()
////Bai 9
class VanBan {
    var xauKiTu: String
    init(xauKiTu: String) {
        self.xauKiTu = xauKiTu
    }
    func vanBan() {
    }
    func nhapVanBan(nhapVanBan: String) {
    }
    func demSoTu() {
        var soTu: Int = 0
        soTu = xauKiTu.count
        print(" So tu trong xau ki tu la \(soTu)")
    }
    func demTuKhoa() {
        let a: Character = "a"
        let A: Character = "A"
        var dem: Int = 0
        for i in xauKiTu {
            if i == a || i == A {
                dem += 1
            }
        }
        print("So tu khoa la \(dem)")
    }
    func sapXep() {
        var chuoi: String = " "
        let a = xauKiTu.split(separator: " ")
        for i in a {
            chuoi += i + " "
        }
        chuoi = chuoi.trimmingCharacters(in: .whitespacesAndNewlines)
        print(chuoi)
    }
}
var a = VanBan(xauKiTu: " .  AAa aag ga gha ")
a.demSoTu()
a.demTuKhoa()
a.sapXep()
//// Bai 10
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
//class Nguoi {
//    var quanLy: GiaoVien
//    init(quanLy: GiaoVien) {
//        self.quanLy = quanLy
//    }
//    func thongTin() {
//        print("Ho va ten \(quanLy.hoTen) co ma so giao vien \(quanLy.maSoGiaoVien)que quan \(quanLy.queQuan)")
//    }
//}
//class CBGV {
//    var quanLyCacGiaoVien: [GiaoVien]
//    init(quanLyCacGiaoVien: [GiaoVien]) {
//        self.quanLyCacGiaoVien = quanLyCacGiaoVien
//    }
//    func themGiaoVien(giaoVienMoi: GiaoVien) {
//        quanLyCacGiaoVien.append(giaoVienMoi)
//    }
//    func quanLy() {
//        for i in quanLyCacGiaoVien {
//            i.hienThongTin()
//        }
//    }
//    func xoaGiaoVien(nhapMaSo: Int) {
//        quanLyCacGiaoVien.removeAll { (GiaoVien) -> Bool in
//            GiaoVien.maSoGiaoVien == nhapMaSo
//        }
//    }
//    func luongGV() {
//        for i in 0 ..< quanLyCacGiaoVien.count {
//            print("Luong thuc linh cua \(quanLyCacGiaoVien[i].hoTen) la \(quanLyCacGiaoVien[i].luongThucLinh)")
//        }
//    }
//}
//var a = Nguoi(quanLy: GiaoVien(hoTen: "Tran A", tuoi: 22, queQuan: "DaNang", maSoGiaoVien: 1, luongCung: 150, luongThuong: 12, tienPhat: 10))
//a.thongTin()
//var b = CBGV(quanLyCacGiaoVien: [GiaoVien(hoTen: "TranA", tuoi: 22, queQuan: "DaNang", maSoGiaoVien: 1, luongCung: 100, luongThuong: 19, tienPhat: 10), GiaoVien(hoTen: "TranB", tuoi: 23, queQuan: "QuangNam", maSoGiaoVien: 2, luongCung: 140, luongThuong: 14, tienPhat: 5)])
//b.themGiaoVien(giaoVienMoi: GiaoVien(hoTen: "TranC", tuoi: 33, queQuan: "QuangNam", maSoGiaoVien: 3, luongCung: 144, luongThuong: 40, tienPhat: 6))
//b.themGiaoVien(giaoVienMoi: GiaoVien(hoTen: "TranD", tuoi: 30, queQuan: "HaNoi", maSoGiaoVien: 4, luongCung: 145, luongThuong: 55, tienPhat: 33))
//b.xoaGiaoVien(nhapMaSo: 11)
//b.quanLy()
//b.luongGV()

//class GiaoVien {
//    var hoTen: String
//    var tuoi: Int
//    var queQuan: String
//    var maSoGiaoVien: Int
//    var luong: Luong
//    init(hoTen: String, tuoi: Int, queQuan: String, maSoGiaoVien: Int, luong: Luong) {
//        self.hoTen = hoTen
//        self.tuoi = tuoi
//        self.queQuan = queQuan
//        self.maSoGiaoVien = maSoGiaoVien
//        self.luong = luong
//    }
//    func hienThongTin() {
//        print("Ho va ten \(hoTen) tuoi \(tuoi) co ma so giao vien la: \(maSoGiaoVien)")
//    }
//    func tienLuong() {
//        print("Luong thuc linh cua \(hoTen) la \(luong.luongThucLinh)")
//    }
//}
//class Luong {
//    var luongCung: Int
//    var luongThuong: Int
//    var tienPhat: Int
//    var luongThucLinh: Int {
//        get {
//            return luongCung + luongThuong - tienPhat
//        }
//    }
//    init(luongCung: Int, luongThuong: Int, tienPhat: Int) {
//        self.luongCung = luongCung
//        self.luongThuong = luongThuong
//        self.tienPhat = tienPhat
//    }
//}
//class Nguoi {
//    var quanLy: GiaoVien
//    init(quanLy: GiaoVien) {
//        self.quanLy = quanLy
//    }
//    func thongTina() {
//        quanLy.hienThongTin()
//    }
//}
//class CBGV {
//    var quanLyCacGiaoVien: [GiaoVien]
//    init(quanLyCacGiaoVien: [GiaoVien]) {
//        self.quanLyCacGiaoVien = quanLyCacGiaoVien
//    }
//    func themGiaoVien(giaoVienMoi: GiaoVien) {
//            quanLyCacGiaoVien.append(giaoVienMoi)
//    }
//     func quanLy() {
//        for i in quanLyCacGiaoVien {
//            i.hienThongTin()
//        }
//    }
//    func xoaGiaoVien(nhapMaSo: Int) {
//        quanLyCacGiaoVien.removeAll { (GiaoVien) -> Bool in
//            GiaoVien.maSoGiaoVien == nhapMaSo
//        }
//    }
//    func luongGV() {
//        for i in quanLyCacGiaoVien {
//            i.tienLuong()
//        }
//    }
//}
//var n = Nguoi(quanLy: GiaoVien(hoTen: "leHai", tuoi: 22, queQuan: "ĐN", maSoGiaoVien: 21, luong: Luong(luongCung: 34, luongThuong: 44, tienPhat: 34)))
//n.thongTina()
//var a = CBGV(quanLyCacGiaoVien: [GiaoVien(hoTen: "TranA", tuoi: 22, queQuan: "DaNang", maSoGiaoVien: 2, luong: Luong(luongCung: 42, luongThuong: 42, tienPhat: 23)), GiaoVien(hoTen: "TranB", tuoi: 24, queQuan: "QuangNam", maSoGiaoVien: 13, luong: Luong(luongCung: 45, luongThuong: 23, tienPhat: 1))])
//a.themGiaoVien(giaoVienMoi: GiaoVien(hoTen: "TranVanC", tuoi: 23, queQuan: "DaNang", maSoGiaoVien: 23, luong: Luong(luongCung: 45, luongThuong: 20, tienPhat: 44)))
//a.quanLy()
//a.xoaGiaoVien(nhapMaSo: 21)
//a.luongGV()
