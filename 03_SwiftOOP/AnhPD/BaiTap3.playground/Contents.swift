import UIKit

class DaGiac {
    var soCanh: Int
    var arr: [Int]
    
    init(soCanh: Int, arr: [Int]) {
        self.soCanh = soCanh
        if soCanh > arr.count {
            self.arr = arr
        } else {
            self.arr = Array(arr[0..<soCanh])
        }
    }
    
    func tinhChuVi() -> Int {
        var p: Int = 0
        for i in 0..<arr.count {
            p += arr[i]
        }
        return(p)
    }
}

class TamGiac : DaGiac {
    override func tinhChuVi() -> Int{
        super.tinhChuVi()
    }
    
    func tinhDienTich() -> Double {
        var s: Double = 0
        s = sqrt(Double(tinhChuVi()) * Double(tinhChuVi() - arr[0]) * Double(tinhChuVi() - arr[1]) * Double(tinhChuVi() - arr[2]))
        return s
    }
}

var dg = DaGiac(soCanh: 3, arr: [2,5,4])
dg.tinhChuVi()
var tg = TamGiac(soCanh: 3, arr: [3,4,5])
tg.tinhChuVi()
tg.tinhDienTich()
