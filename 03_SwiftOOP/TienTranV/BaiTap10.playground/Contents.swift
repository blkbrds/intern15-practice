import UIKit

final class A {
    var n: Int

    init(n: Int) {
        self.n = n
    }

    func tinhTongNSoNguyenDuongDauTien() -> Int {
        var tong = 0
        for index in 0..<n {
            tong = tong + index
        }
        return tong
    }
}

var aa = A(n: 10)
print(aa.tinhTongNSoNguyenDuongDauTien())
