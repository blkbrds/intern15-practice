//import UIKit

class DaGiac{
    var socanh:Int
    var mang: [Int]
    init(socanh:Int,mang:[Int]) {
        self.socanh = socanh
        self.mang = mang
    }
    func chuVi() -> Int{
        var cv: Int = 0
        for i in 0...socanh-1{
            cv = cv + mang[i]
        }
        return cv
    }
    func hinhHoc() -> String{
        switch socanh {
        case 3:
            return "Hinh tam giac"
        case 4:
            return "HInh tu giac"
        case 5:
            return "Hinh ngu giac"
        case 6:
            return "Hinh luc giac"
        case 7:
            return "Hinh that giac"
        case 8:
            return "Hinh bat giac"
        default:
            return "Da giac"
        }
    }
}
let sc:Int = 3
let arr:[Int] = [3,4,5]
let d = DaGiac(socanh: sc, mang: arr)
let rs = d.chuVi()
print("Chu vi cua \(d.hinhHoc()) la: \(rs)")
print("Chieu dai cac canh lan luot la ")
for i in 0...sc-1{
    print(arr[i])
}

