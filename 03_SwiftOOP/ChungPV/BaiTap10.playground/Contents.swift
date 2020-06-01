//import UIKit

class TinhTong{
    var n: Int
    init(n: Int ) {
        self.n = n
    }
    func tinhTong() -> Int {
        var sum = 0
        for i in 1...n{
            sum = sum + i
        }
        return sum
    }
    func inTong() {
        print("Tong cac so la: \(tinhTong())")
    }
}

var tinh = TinhTong(n: 10)
tinh.tinhTong()
tinh.inTong()
