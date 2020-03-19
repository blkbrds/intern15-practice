import UIKit

class TinhTong{
    var n: Int
    
    init(n: Int){
        self.n = n
    }
    func tongNSoNGuyen() -> Int {
       var tong = 0
        for i in 0...n {
            tong = tong + i
        }
        print("Tong cac so nguyen la \(tong)")
        return tong
    }
}
var nhapN = TinhTong(n: 2)
nhapN.tongNSoNGuyen()
