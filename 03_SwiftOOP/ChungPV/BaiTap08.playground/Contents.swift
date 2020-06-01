//import UIKit

class Date{
    var ngay: Int
    var thang: Int
    var nam: Int
    
    init(ngay: Int, thang: Int, nam: Int) {
        self.ngay = ngay
        self.thang = thang
        self.nam = nam
    }
    func daysIn() -> Int {
        var ngayThang: Int
        switch self.thang {
        case 1,3,5,7,8,12:
            ngayThang = 31
        case 4,6,9,11:
             ngayThang = 30
        default:
            if nam % 400 == 0 || nam % 4 == 0 && nam % 100 != 0 {
                ngayThang = 29
            } else {
                ngayThang = 28
            }
        }
        return ngayThang
    }
    func normalize() -> String{
        if ngay < daysIn() || ngay > daysIn(){
            return "Ngay khong hop le"
        }
        if thang < 00 || thang > 12 {
            return "Thang khong hop le"
        }
        if nam < 0 {
            return "Nam khong hop le"
        }
        return "Ngay, thang, nam hop le"
    }
    func printDate() {
        print("Ngay \(ngay) thang \(thang) nam \(nam)")
    }
}
var ngay  = Date(ngay: 32, thang: 12, nam: 2020)
ngay.printDate()
print("\(ngay.normalize())")
print("Thang nay co \(ngay.daysIn())")
