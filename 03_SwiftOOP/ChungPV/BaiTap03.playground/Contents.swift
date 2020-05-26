//import UIKit
import Foundation

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
}
class TamGiac: DaGiac {
    var a : Int
    var b: Int
    var c: Int
    init(mang: [Int]) {
        a = mang[0]
        b = mang[1]
        c = mang[2]
        super.init(socanh: 3, mang: mang)
    }
    override func chuVi() -> Int {
        let cv: Int = a+b+c
        return cv
    }
    func dienTichTamGiac() -> Double {
        let p = chuVi()/2
        let s = sqrt(Double(p*(p-a)*(p-b)*(p-c)))
        return s

    }
}
let tg = TamGiac(mang: [4,5,6])
print("Chu vi tam giac \(tg.chuVi())")
print("Dien tich tam giac \(tg.dienTichTamGiac())")
