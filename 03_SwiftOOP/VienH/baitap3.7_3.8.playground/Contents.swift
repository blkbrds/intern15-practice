import UIKit

class HocSinh {
    var namSinh: Date
    var hoTen: String
    var tongDiem: Float
    init(hoTen: String, namSinh: Date, tongDiem: Float) {
        self.namSinh = namSinh
        self.hoTen = hoTen
        self.tongDiem = tongDiem
    }
}

extension String {
    func vietHoaChuDau() -> String {
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
        return nam % 400 == 0
    }
    func daySin(in thang: Int) -> Int {
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
    func norMaliz() -> Date? {
        guard nam < 1 else { return nil }
        guard thang < 0 || thang > 12 else { return nil }
        guard ngay < 0 || ngay > daySin(in: thang) else { return nil }
        return self
    }
    func inNgay() -> Date? {
        guard nam < 1 else { return nil }
        guard thang < 0 || thang > 12 else { return nil }
        guard ngay < 0 || ngay > daySin(in: thang) else { return nil }
        return self
    }
    func inNgay() {
        print("\(ngay)/\(thang)/\(nam)")
        print("ngay la day", ngay)
    }
}
extension Array where Element: HocSinh {
    func sepXepHocSinh() -> [HocSinh] {
        var dsHocSinh: [HocSinh] = self
        dsHocSinh.sort { (hs1, hs2) -> Bool in
            guard hs1.tongDiem <= hs2.tongDiem else { return false }
            if hs1.tongDiem < hs2.tongDiem { return true }
            return hs1.hoTen < hs2.hoTen
        }
        return dsHocSinh
    }
}
let danhSachHocSinh = [HocSinh(hoTen: "Hoang Vien", namSinh: Date.init(ngay: 07, thang: 05, nam: 1997), tongDiem: 5),
    HocSinh(hoTen: "Thong Mylove", namSinh: Date.init(ngay: 01, thang: 01, nam: 1996), tongDiem: 8),
    HocSinh(hoTen: " Master Hanh", namSinh: Date.init(ngay: 02, thang: 02, nam: 1996), tongDiem: 9),]



