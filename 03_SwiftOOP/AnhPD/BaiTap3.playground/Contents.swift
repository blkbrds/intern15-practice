import UIKit

class DaGiac {
    var socanh: Int
    var arr: [Int]
    init(socanh: Int,arr: [Int]) {
        self.socanh = socanh
        self.arr = arr
    }
    func chuVi() -> Int {
        var chuvi: Int = 0
        for i in 0 ..< arr.count {
            chuvi = chuvi + arr[i]
        }
        return chuvi
    }
}
class tamgiac : DaGiac {
    override  func chuVi() -> Int{
        super.chuVi()
        var chuvi: Int = 0
        for i in 0 ..< arr.count {
           chuvi = chuvi + arr[i]
       }
        return chuvi
    }
    func dienTich() -> Double {
        var S: Double = 0
        var p: Double = Double(chuVi())
        S = sqrt(p * (p - Double(arr[0])) * (p - Double(arr[1])) * (p - Double(arr[2])) )
        return S
    }
}
var tg = tamgiac(socanh: 3, arr: [3,4,5])
tg.chuVi()
tg.dienTich()
