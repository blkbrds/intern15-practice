import UIKit

class A {
    var s: Int
    init(s: Int) {
        self.s = s
    }

    func tinhTong() {
        var tong: Int = 0
        for i in 0...s {
            tong += i
        }
        print("Tong = \(tong) ")
    }
}

var a = A(s: 10)
a.tinhTong()
