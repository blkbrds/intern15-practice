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
    
    func tinhChuViDaGiac() -> String {
        var p: Int = 0
        for i in 0..<arr.count {
            p += arr[i]
            print("Độ dài cạnh thứ \(i + 1) là: \(arr[i])")
        }
        return("Chu vi = \(String(p))")
    }
}
var dg = DaGiac(soCanh: 5, arr: [4,2,5,3,8])
print(dg.tinhChuViDaGiac())
