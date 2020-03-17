import UIKit

class Date{
    var ngay  : Int
    var thang: Int
    var nam : Int

    init(ngay: Int, thang: Int, nam: Int){
        self.ngay = ngay
        self.thang = thang
        self.nam = nam
    }
    func hamTruyCapDuLieu()->String{
        return "Ngay \(ngay) thang \(thang) nam \(nam)"
    }
    
    func normalize() {
        if ngay > 31 || ngay < 0{
            print("Ngay khong hop le")
        }
        if thang < 0 || thang > 12{
            print("Thang khong hop le")
        }
        if nam < 0 {
            print("Nam khong hop le")
        }
        
        let thang30Ngay = [4,6,9,11]
        for i in thang30Ngay{
            if i == thang && ngay > 30{
                print("Ngay khong hop le")
            }
        }
        if thang == 2 && nam % 4 == 0 && ngay > 29{
            print("Ngay khong hop le")
        }
        if thang == 2 && nam % 4 != 0 && ngay > 28{
            print("Ngay khong hop le")
        }
    }
}
func daysIn(thang:Int)->Int{
    let thang30Ngay = [4,6,9,11]
    var soNgay:Int = 0
    for i in thang30Ngay{
        if i == thang {
            soNgay = 30
        } else{
            soNgay = 31
        }
    }
    print ("So ngay cua thang la :\(soNgay)")
    return soNgay
}

var hienThi = Date.init(ngay: 31, thang: 6, nam: 4)
hienThi.hamTruyCapDuLieu()
hienThi.normalize()
print(hienThi.hamTruyCapDuLieu())
daysIn(thang: 8)
