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
        
        if thang < 0 || thang > 12{
            return("Thang khong hop le")
        }
        if nam < 0 {
            return("Nam khong hop le")
        }

       let soNgay = daysIn(thang: thang, nam: nam)
        if soNgay < ngay {
            return("Ngay khong hop le")
        }
        
        return ("Ngay hop le")
        }
}

func daysIn(thang:Int, nam: Int) -> Int{
    let thang30Ngay = [4,6,9,11]
    if nam % 4 == 0  && thang == 2{
        print("So ngay cua thang 2 la: 29 ")
        return (29)
    }
    if nam % 4 != 0 && thang == 2{
        print("So ngay cua thang 2 la: 28")
        return (28)
    }
    var soNgay:Int = 0
    for i in thang30Ngay{
        if i == thang {
            soNgay = 30
        }else{
            soNgay = 31
        }
    }
    print ("So ngay cua thang \(thang) la: \(soNgay)")
    
    return (soNgay)
}
var ngayBatKy = Date(ngay: 30, thang: 2, nam: 2020)
ngayBatKy.hamTruyCapDuLieu()
print(ngayBatKy.hamTruyCapDuLieu())
print(ngayBatKy.kiemTraNgay())
daysIn(thang: 9, nam: 2020)
