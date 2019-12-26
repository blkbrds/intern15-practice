import UIKit

final class A {
    static func tinhTong(n: Int) {
        var s = 0
        for i in 1...n {
            s = s + i
        }
        print("tong của phuong trinh S =", s)
    }
}
A.tinhTong(n: 3)
