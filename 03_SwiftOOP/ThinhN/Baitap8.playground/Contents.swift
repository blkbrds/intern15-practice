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
    func hamTruyCapDuLieu() -> String{
        return "Ngay \(ngay) thang \(thang) nam \(nam)"
    }
    
    func kiemTraNgay() -> String {
        if ngay > 31 || ngay < 0{
            return("Ngay khong hop le")
        }
        if thang < 0 || thang > 12{
            return("Thang khong hop le")
        }
        if nam < 0 {
            return("Nam khong hop le")
        }
        
        let thang30Ngay = [4,6,9,11]
        for i in thang30Ngay{
            if i == thang && ngay > 30{
                return("Ngay khong hop le")
            }
        }
        if thang == 2 && nam % 4 == 0 && ngay > 29{
            return("Ngay khong hop le")
        }
        if thang == 2 && nam % 4 != 0 && ngay > 28{
            return "Ngay khong hop le"
        }
        return ("Ngay hop le")
    }
        
}
func daysIn(thang:Int, nam: Int) -> Int{
    let thang30Ngay = [4,6,9,11]
    if nam % 4 == 0  && thang == 2{
        print("So ngay cua thang la: 29 ")
        return (29)
    }
    if nam % 4 != 0 && thang == 2{
        print("So ngay cua thang la: 28")
        return (28)
    }
    var soNgay:Int = 0
    for i in thang30Ngay{
        if i == thang {
            soNgay = 30
        } else{
            soNgay = 31
        }
    }
    print ("So ngay cua thang la: \(soNgay)")
    
    return (soNgay)
}

var ngayBatKy = Date(ngay: 20, thang: 2, nam: 2020)
ngayBatKy.hamTruyCapDuLieu()
ngayBatKy.kiemTraNgay()
print(ngayBatKy.hamTruyCapDuLieu())
daysIn(thang: 2, nam: 2020)
print(ngayBatKy.kiemTraNgay())
