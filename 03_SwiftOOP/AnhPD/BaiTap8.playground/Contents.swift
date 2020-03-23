import UIKit

class Date {
    var ngay: Int
    var thang: Int
    var nam: Int

    init(ngay: Int,thang: Int,nam: Int) {
        self.ngay = ngay
        self.thang = thang
        self.nam = nam
    }

    func kTraNgayTrongThang() -> Int {
        var soNgay = 31
        switch self.thang {
        case 4,6,9,11:
            soNgay = 30
        case 2:
            if self.nam % 400 == 0 {
                soNgay = 29
            } else if self.nam % 4 == 0 && self.nam % 100 != 0 {
                soNgay = 28
            }
        default:
            soNgay = 31
        }
        return soNgay
    }

    func normalize() {
        if self.ngay > kTraNgayTrongThang() || self.ngay < 1 {
            self.ngay = 14
        }
        if self.thang > 12 || self.thang < 1 {
            self.thang = 7
        }
        if self.nam < 1 {
            self.nam = 1997
        }
    }

    func advance(y: Int,m: Int,d: Int) {
        self.ngay = y
        self.thang = m
        self.nam = d
    }

    func inNgay() {
        print("\(ngay)/\(thang)/\(nam)")
    }
}

var n1 = Date(ngay: 32,thang: 13,nam: 0)
n1.kTraNgayTrongThang()
n1.normalize()
//n1.advance(y: 1,m: 1,d: 2015)
n1.inNgay()
