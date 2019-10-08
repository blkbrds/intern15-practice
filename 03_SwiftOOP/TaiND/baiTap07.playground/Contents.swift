import UIKit

class HocSinh {
    var hoTen: String
    var namSinh: Date
    var tongDiem: Float
    init(hoTen: String, namSinh: Date, tongDiem: Float) {
        self.namSinh = namSinh
        self.hoTen = hoTen.chuCaiDauGhiHoa()
        self.tongDiem = tongDiem
    }
}
extension String {
    func chuCaiDauGhiHoa() -> String {
        var bienTam: [Character] = Array(self)
        guard !bienTam.isEmpty else { return "" }
        bienTam[0] = Character(bienTam[0].uppercased())
        for i in 0..<bienTam.count - 1 where bienTam[i] == " " {
            bienTam[i + 1] = Character(bienTam[i + 1].uppercased())
        }
        return String(bienTam)
    }
}
struct Date {
    var ngay: Int
    var thang: Int
    var nam: Int
    init(ngay: Int, thang: Int, nam: Int) {
        self.ngay = ngay
        self.thang = thang
        self.nam = nam
    }
    func namNhuan(nam: Int) -> Bool {
        return nam % 400 == 0 || nam % 4 == 0 && nam % 100 != 0
    }
    func namSinh(in thang: Int) -> Int {
        switch thang {
        case 1, 3, 5, 7, 8, 10, 12:
            return 31
        case 4, 6, 9, 11:
            return 30
        case 2:
            return namNhuan(nam: self.nam) ? 29 : 28
        default:
            return 31
        }
    }
    func normaliz() -> Date? {
        guard nam < 1 else { return nil }
        guard thang < 0 || thang > 12 else { return nil }
        guard ngay < 0 || ngay > namSinh(in: thang) else { return nil }
        return self
    }
    func inNgay() {
        print("\(ngay)/\(thang)/\(nam)")
        print("ngay la day ", ngay)
    }
}
extension Array where Element: HocSinh {
    func sapXepHocSinh() -> [HocSinh] {
        var danhSachHocSinh: [HocSinh] = self
        danhSachHocSinh.sort { (hs1, hs2) -> Bool in
            guard hs1.tongDiem <= hs2.tongDiem else { return false }
            if hs1.tongDiem < hs2.tongDiem {
                return true
            }
            return hs1.hoTen < hs2.hoTen
        }
        return danhSachHocSinh
    }
}
let danhsachhocsinh = [HocSinh(hoTen: "Nguyễn Văn A", namSinh: Date(ngay: 20, thang: 2, nam: 1991), tongDiem: 7),
                       HocSinh(hoTen: "Nguyễn Văn B", namSinh: Date.init(ngay: 15, thang: 3, nam: 1992), tongDiem: 9),
                       HocSinh(hoTen: "Nguyễn Văn C", namSinh: Date.init(ngay: 7, thang: 2, nam: 1994), tongDiem: 9),
                       HocSinh(hoTen: "Nguyễn Văn D", namSinh: Date.init(ngay: 8, thang: 5, nam: 1996), tongDiem: 9)]

