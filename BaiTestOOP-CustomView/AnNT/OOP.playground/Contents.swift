import UIKit

enum GioiTinh: String {
    case nam, nu, khac
}

class CanBo {
    var ten: String
    var tuoi: Int
    var gioiTinh: GioiTinh
    var diaChi: String

    init() {
        self.ten = ""
        self.tuoi = 0
        self.gioiTinh = GioiTinh.khac
        self.diaChi = ""
    }

    init(ten: String, tuoi: Int, gioiTinh: GioiTinh, diaChi: String) {
        self.ten = ten
        self.tuoi = tuoi
        self.gioiTinh = gioiTinh
        self.diaChi = diaChi
    }
    
    func hienThiChiTiet(){
        print("Tên:             \(self.ten)")
        print("Tuổi:            \(self.tuoi)")
        print("Giới tính:        \(self.gioiTinh.rawValue)")
        print("Địa chỉ:          \(self.diaChi)")
    }
}

class CongNhan: CanBo {
    private var bac: Int {
        didSet {
            assert(self.bac > 10 || self.bac < 1, "Bậc thuộc 1...10")
        }
    }

    override init() {
        self.bac = 1
        super.init()
    }

    init(ten: String, tuoi: Int, gioiTinh: GioiTinh, diaChi: String, bac: Int) {
        self.bac = 1
        super.init(ten: ten, tuoi: tuoi, gioiTinh: gioiTinh, diaChi: diaChi)
    }
    
    override func hienThiChiTiet() {
        super.hienThiChiTiet()
        print("Bậc :      \(self.bac)")
    }
}

class KiSu: CanBo {
    private var nganhDaoTao: String

    override init() {
        self.nganhDaoTao = ""
        super.init()
    }

    init(ten: String, tuoi: Int, gioiTinh: GioiTinh, diaChi: String, nganhDaoTao: String) {
        self.nganhDaoTao = nganhDaoTao
        super.init(ten: ten, tuoi: tuoi, gioiTinh: gioiTinh, diaChi: diaChi)
    }
    
    override func hienThiChiTiet() {
        super.hienThiChiTiet()
        print("Ngành đào tạo:      \(self.nganhDaoTao)")
    }
}

class NhanVien: CanBo {
    private var congViec: String

    override init() {
        self.congViec = ""
        super.init()
    }

    init(ten: String, tuoi: Int, gioiTinh: GioiTinh, diaChi: String, congViec: String) {
        self.congViec = congViec
        super.init(ten: ten, tuoi: tuoi, gioiTinh: gioiTinh, diaChi: diaChi)
    }
    
    override func hienThiChiTiet() {
        super.hienThiChiTiet()
        print("Công việc:      \(self.congViec)")
    }
}

class QuanLyCanBo {
    private var cacCanBo = [CanBo]()

    static let quanLyCanBo: QuanLyCanBo = {
        let qlcb = QuanLyCanBo()
        return qlcb
    }()

    private init() { }

    static func shared() -> QuanLyCanBo {
        return self.quanLyCanBo
    }
    
    func themMoiCanBo(canBo: CanBo){
        cacCanBo.append(canBo)
    }
    
    func timKiemTheoHoTen(hoTenTimKiem: String) -> [CanBo]{
        let tenTimKiemLowerCased = hoTenTimKiem.lowercased()
        var ketQua = [CanBo]()
        ketQua = self.cacCanBo.filter({ $0.ten.lowercased().hasPrefix(tenTimKiemLowerCased) })
        print("Kết quả tìm kiếm với tên: \(hoTenTimKiem)")
        ketQua.forEach({
            $0.hienThiChiTiet()
        })
        return ketQua
    }
    
    func hienThiDanhSachCanBo(){
        print("Thông tin tất cả cán bộ đang quản lý:")
        self.cacCanBo.forEach({ canBo in
            if canBo is CongNhan {
                print("Thông tin công nhân: ")
            }else if canBo is KiSu {
                print("Thông tin kĩ sư: ")
            }else {
                print("Thông tin nhân viên: ")
            }
            canBo.hienThiChiTiet()
        })
    }
}

let quanLyCanBo = QuanLyCanBo.shared()

// Thêm mới cán bộ

let nhanVien1 = NhanVien(ten: "Đoàn Văn Anh", tuoi: 20, gioiTinh: .nam, diaChi: "Hà Nội", congViec: "Dev")
let kiSu1 = KiSu(ten: "Lê Cẩm", tuoi: 20, gioiTinh: .nam, diaChi: "Hà Nội", nganhDaoTao: "CNTT")
let congNhan1 = CongNhan(ten: "Lê Anh", tuoi: 20, gioiTinh: .nam, diaChi: "Hà Nội", bac: 4)

quanLyCanBo.themMoiCanBo(canBo: nhanVien1)
quanLyCanBo.themMoiCanBo(canBo: kiSu1)
quanLyCanBo.themMoiCanBo(canBo: congNhan1)
quanLyCanBo.hienThiDanhSachCanBo()
quanLyCanBo.timKiemTheoHoTen(hoTenTimKiem: "đoàn văn")
