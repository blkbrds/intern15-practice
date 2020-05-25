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

class Dictionary {
    var duLieuNhap: [String: Int]
    init(duLieuNhap: [String: Int]) {
        self.duLieuNhap = duLieuNhap
    }
    func khoiTao() {
        print(duLieuNhap)
    }
    func kiemTraSoNguyenTo(soNhap: Int) -> Bool {
        if soNhap == 2 {
            return true
        }
        if soNhap == 1 {
                  return false
              }
        for i in 1..<soNhap - 1 {
            print(soNhap)
            if soNhap % i == 0 {
                return false
            }
        }
        return true
    }
    func kiemTra() ->Bool  {
        for (_,value) in duLieuNhap where kiemTraSoNguyenTo(soNhap: value) == true {
            return true
        }
        return false
    }
//    func kiemTraSoHoanHao() -> Bool {
//        var soTam: Int = 0
////        for i in duLieuNhap.values {
////            print(i)
//////            if duLieuNhap.values % i == 0 {
//////                soTam += i
//////            }
//////            if soTam == duLieuNhap.values {
//////                return true
//////            }
////        }
////        return false
//
//    }
    func kiemtra() {
        for i in 0..<duLieuNhap.count {
            print(i)
        }
    }
//    func kiemTraSoChinhPhuong() -> Bool {
//        var i: Int = sqrt(duLieuNhap.values)
//        print(duLieuNhap.values)
//        if sqrtf(duLieuNhap.values) * sqrtf(duLieuNhap.values) == duLieuNhap.values {
//            return true
//        }
//        return false
//    }
    
}
var duLieu = Dictionary(duLieuNhap: ["TranVanA": 5])
duLieu.khoiTao()
duLieu.kiemtra()
//duLieu.kiemTra()
//duLieu.kiemTraSoNguyenTo(soNhap: 2)
//duLieu.kiemTraSoHoanHao(soNhap: 495)
//duLieu.kiemTraSoChinhPhuong()
//// -- Bai 4--
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
//            print("Hoc sinh \(i.hoTen) so bao danh \(i.soBaoDanh) o dia chi \(i.diaChi) khoi thi \(i.khoiThi)")
//        }
//    }
//    func timKiem(nhapSoBaoDanh: Int) {
//        for i in thiSinh {
//            if i.soBaoDanh == nhapSoBaoDanh {
//                print("\(i.hoTen) co so bao danh \(i.soBaoDanh) o dia chi \(i.diaChi) thi khoi \(i.khoiThi)")
//            }
//        }
//    }
//}
////var LeNam = ThiSinh(soBaoDanh: 12, hoTen: "LeNam", diaChi: "DaNang", mucUuTien: 1, khoiThi: "A", monThi: "Ly")
////LeNam.thiSinh(a: ThiSinh(soBaoDanh: 11, hoTen: "ff", diaChi: "ff", mucUuTien: 2))
//var khoiA = KhoiThi(monThi: "Toan Ly Hoa", ten: "KhoiA")
//var khoiB = KhoiThi(monThi: "Toan Hoa Sinh", ten: "KhoiB")
//var khoiC = KhoiThi(monThi: "Van Su Dia", ten: "KhoiC")
//var b = TuyenSinh(thiSinh: [ThiSinh(soBaoDanh: 13, hoTen: "TranVanA", diaChi: "DaNang", mucUuTien: 1, khoiThi: [khoiA, khoiB])])
//b.themThiSinh(thiSinhThem: ThiSinh(soBaoDanh: 14, hoTen: "TranVanC", diaChi: "Hanoi", mucUuTien: 3, khoiThi: [khoiB]))
//b.themThiSinh(thiSinhThem: ThiSinh(soBaoDanh: 15, hoTen: "TranVanD", diaChi: "Hanoi", mucUuTien: 2, khoiThi: [khoiC]))
//b.hienThongTin()
//b.timKiem(nhapSoBaoDanh: 14)
//class ThuVien {
//    var cacLoaiSach: [Sach]
//    var cacLoaiTapChi: [TapChi]
//    var cacLoaiBao: [Bao]
//    init(cacLoaiSach: [Sach], cacLoaiTapChi: [TapChi], cacLoaiBao: [Bao] ) {
//        self.cacLoaiSach = cacLoaiSach
//        self.cacLoaiTapChi = cacLoaiTapChi
//        self.cacLoaiBao = cacLoaiBao
//    }
//}
//class Sach {
//    var maTaiLieu: Int
//    var tenNhaXuatBan: String
//    var soBanPhatHanh: Int
//    var tenTacGia: String
//    var soTrang: Int
//    init(maTaiLieu: Int, tenNhaXuatBan: String, soBanPhatHanh: Int, tenTacGia: String, soTrang: Int) {
//        self.maTaiLieu = maTaiLieu
//        self.tenNhaXuatBan = tenNhaXuatBan
//        self.soBanPhatHanh = soBanPhatHanh
//        self.tenTacGia = tenTacGia
//        self.soTrang = soTrang
//    }
//    func thongTin() {
//        print(" Sach co ma tai lieu \(maTaiLieu) cua tac gia \(tenTacGia) xuat ban boi \(tenNhaXuatBan)")
//    }
//}
//class TapChi {
//    var maTaiLieu: Int
//    var tenNhaXuatBan: String
//    var soBanPhatHanh: Int
//    var soPhatHanh: Int
//    var thangPhatHanh: Int
//    init(maTaiLieu: Int, tenNhaXuatBan: String, soBanPhatHanh: Int, soPhatHanh: Int, thangPhatHanh: Int) {
//        self.maTaiLieu = maTaiLieu
//        self.tenNhaXuatBan = tenNhaXuatBan
//        self.soBanPhatHanh = soBanPhatHanh
//        self.soPhatHanh = soPhatHanh
//        self.thangPhatHanh = thangPhatHanh
//    }
//    func thongTin() {
//           print(" Tap chi co ma tai lieu \(maTaiLieu) xuat ban boi \(tenNhaXuatBan)")
//       }
//}
//class Bao {
//    var maTaiLieu: Int
//    var tenNhaXuatBan: String
//    var soBanPhatHanh: Int
//    var ngayPhatHanh: Int
//    init(maTaiLieu: Int, tenNhaXuatBan: String, soBanPhatHanh: Int, ngayPhatHanh: Int) {
//        self.maTaiLieu = maTaiLieu
//        self.tenNhaXuatBan = tenNhaXuatBan
//        self.ngayPhatHanh = ngayPhatHanh
//        self.soBanPhatHanh = soBanPhatHanh
//    }
//    func thongTin() {
//           print(" Bao co ma tai lieu \(maTaiLieu) xuat ban boi \(tenNhaXuatBan)")
//       }
//}
//class QuanLySach {
//    var cacLoaiSach: [Sach]
//    var cacLoaiBao: [Bao]
//    var cacLoaiTapChi: [TapChi]
//    init (cacLoaiBao: [Bao], cacLoaiSach: [Sach], cacLoaiTapChi: [TapChi]) {
//        self.cacLoaiBao = cacLoaiBao
//        self.cacLoaiSach = cacLoaiSach
//        self.cacLoaiTapChi = cacLoaiTapChi
//    }
//    func thongTin() {
//        for i in cacLoaiSach {
//            i.thongTin()
//        }
//        for i in cacLoaiTapChi {
//            i.thongTin()
//        }
//        for i in cacLoaiBao {
//            i.thongTin()
//        }
//    }
//    func xoaTaiLieu(nhapMaTaiLieu: Int) {
//        cacLoaiSach.removeAll { (Sach) -> Bool in
//            Sach.maTaiLieu == nhapMaTaiLieu
//        }
//        cacLoaiBao.removeAll { (Bao) -> Bool in
//            Bao.maTaiLieu == nhapMaTaiLieu
//        }
//        cacLoaiTapChi.removeAll { (TapChi) -> Bool in
//            TapChi.maTaiLieu == nhapMaTaiLieu
//        }
//    }
//    func themMoiSach(nhapSach: Sach) {
//        for i in cacLoaiSach {
//            cacLoaiSach.append(nhapSach)
//            i.thongTin()
//        }
//    }
//    func themMoiTapChi(nhapTapChi: TapChi) {
//        for i in cacLoaiTapChi {
//            cacLoaiTapChi.append(nhapTapChi)
//            i.thongTin()
//        }
//    }
//    func themMoiBao(nhapBao: Bao) {
//        for i in cacLoaiBao {
//            cacLoaiBao.append(nhapBao)
//            i.thongTin()
//        }
//    }
//    func timKiem(nhapMaTaiLieu: Int) {
//        for i in cacLoaiBao {
//            if i.maTaiLieu == nhapMaTaiLieu {
//                i.thongTin()
//            }
//        }
//        for i in cacLoaiSach {
//            if i.maTaiLieu ==  nhapMaTaiLieu {
//                i.thongTin()
//            }
//        }
//        for i in cacLoaiTapChi {
//            if i.maTaiLieu == nhapMaTaiLieu {
//                i.thongTin()
//            }
//        }
//    }
//}
//var a = QuanLySach(cacLoaiBao: [Bao(maTaiLieu: 1, tenNhaXuatBan: "KimDong", soBanPhatHanh: 100, ngayPhatHanh: 24), Bao(maTaiLieu: 2, tenNhaXuatBan: "ThieuNien", soBanPhatHanh: 24, ngayPhatHanh: 25)], cacLoaiSach: [Sach(maTaiLieu: 20, tenNhaXuatBan: "KimDong", soBanPhatHanh: 100, tenTacGia: "TranA", soTrang: 104)], cacLoaiTapChi: [TapChi(maTaiLieu: 100, tenNhaXuatBan: "Abert", soBanPhatHanh: 22, soPhatHanh: 14, thangPhatHanh: 5)])
//a.thongTin()
//a.themMoiSach(nhapSach: Sach(maTaiLieu: 21, tenNhaXuatBan: "ThanhNien", soBanPhatHanh: 23, tenTacGia: "Tran B", soTrang: 30))
//a.timKiem(nhapMaTaiLieu: 20)
//a.timKiem(nhapMaTaiLieu: 100)
////Bai 6
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
//            thongTinKhach.append(khachDuocThem)
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
//var a = KhachSan(thongTinKhach: [Nguoi(hoTen: "TranA", tuoi: 20, soCMND: 111, soNgayThue: 10, loaiPhong: "A"), Nguoi(hoTen: "TranB", tuoi: 21, soCMND: 222, soNgayThue: 2, loaiPhong: "A"), Nguoi(hoTen: "TranC", tuoi: 23, soCMND: 333, soNgayThue: 3, loaiPhong: "C")])
//a.themKhachHang(khachDuocThem: Nguoi(hoTen: "TranE", tuoi: 32, soCMND: 555, soNgayThue: 5, loaiPhong: "C"))
//a.themKhachHang(khachDuocThem: Nguoi(hoTen: "TranD", tuoi: 33, soCMND: 444, soNgayThue: 6, loaiPhong: "A"))
//a.xoaKhachHang(nhapCMND: 444)
//a.quanLyKhachHang()
//a.tinhTien(nhapCMND: 333)
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
//    func thongTin() {
//        for i in khachHang {
//            i.thongTin()
//        }
//    }
//    func themKhachHang(khachHangMoi: KhachHang) {
//            khachHang.append(khachHangMoi)
//    }
//    func xoaKhachHang() {
//
//    }
//    func tinhTienDien() {
//        var soTienTra: Int
//        for i in khachHang {
//            soTienTra = (i.chiSoDienMoi - i.chiSoDienCu) * 5
//            print("So tien phai tra cua khach hang \(i.hoTen) la \(soTienTra)")
//        }
//    }
//
//}
//
//var b = BienLai(khachHang: [KhachHang(hoTen: "TranVanA", soNha: 1, maCongToDien: 20, chiSoDienCu: 14, chiSoDienMoi: 17),KhachHang(hoTen: "TranVanB", soNha: 2, maCongToDien: 13, chiSoDienCu: 15, chiSoDienMoi: 20)])
//b.tinhTienDien()
//b.themKhachHang(khachHangMoi: KhachHang(hoTen: "TranVanB", soNha: 3, maCongToDien: 13, chiSoDienCu: 45, chiSoDienMoi: 69))
//b.themKhachHang(khachHangMoi: KhachHang(hoTen: "TranVanC", soNha: 4, maCongToDien: 14, chiSoDienCu: 77, chiSoDienMoi: 88))
//b.thongTin()
//b.tinhTienDien()
//// Bai 8
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
//class VanBan {
//    var chuoiKiTu: String
//    var vanBan: String
//    init(chuoiKiTu: String, vanBan: String) {
//        self.chuoiKiTu = chuoiKiTu
//        self.vanBan = vanBan
//    }
//    func demSoTu() {
//        var a = 0
//        for i in vanBan {
//            a = vanBan.count
//        }
//        //print(a)
//    }
//    func demTuKhoa() {
//        let a: Character = "a"
//        let b: Character = "A"
//        var dem: Int = 0
//        for i in vanBan {
//            if i == a || i == b {
//                dem += 1
//            }
//        }
//        print(dem)
//    }
//    func sapXep() -> String{
//        let n: Character = " "
//
//        let giaTriDau: String.Index = vanBan.startIndex
//        let giaTriCuoi: String.Index = vanBan.endIndex
//        vanBan.removeAll { (Character) -> Bool in
//            vanBan[giaTriDau] == n || vanBan[giaTriCuoi] == n
//        }
//        return (vanBan)
//        }
//        for i in vanBan {
//            if vanBan[giaTriDau] == n || vanBan[giaTriCuoi] == n {
//                vanBan.remove(at: giaTriDau)
//            }
//        }
//        vanBan[giaTriCuoi]
//        vanBan.startIndex
//        for i in 0 ..< vanBan.count - 1 {
//            for j in i + 1..<vanBan.count {
////                if i = "" && i
//            }
//
//        }
//    }
//
//}
//var aa = VanBan(chuoiKiTu: "", vanBan: " aaa AAff ")
//aa.sapXep()
//aa.demSoTu()
//aa.demTuKhoa()

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
//
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
