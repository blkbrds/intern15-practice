import UIKit

class DaGiac {
    var socanh: Int
    var arr: [Int]
    init(socanh: Int, arr: [Int])  {
        self.socanh = socanh
        self.arr = arr
    }
    func chuVi() -> Int {
        var chuvi : Int = 0
        for i in 0..<arr.count {
            chuvi = chuvi + arr[i]
        }
        return chuvi
    }
    func soCanhDaGiac() {
        for i in 0..<arr.count {
            print("Canh thu \(i + 1) = \(arr[i])")
        }
    }
}
var dagiac = DaGiac(socanh: 5, arr: [1,2,3,4,5])
print(dagiac.chuVi())
dagiac.soCanhDaGiac()
