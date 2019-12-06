import UIKit

class DaGiac {
    let soCanh: Int
    let kichThuocCanh: [Int]

    init(soCanh: Int, kichThuocCanh: [Int]) {
        self.soCanh = soCanh
        self.kichThuocCanh = kichThuocCanh
    }

    func tinhChuVi() -> Int {
        var chuVi = 0
        for i in 0...soCanh - 1 {
            chuVi += kichThuocCanh[i]
        }
        return chuVi
    }

    func inGiaTriCacCanh() -> [Int] {
        return kichThuocCanh
    }
}

class TamGiac: DaGiac {
    var a: Int
    var b: Int
    var c: Int

    init(kichThuocCanh: [Int]) {
        self.a = kichThuocCanh[0]
        self.b = kichThuocCanh[1]
        self.c = kichThuocCanh[2]
        super.init(soCanh: 3, kichThuocCanh: kichThuocCanh)
    }

    override func tinhChuVi() -> Int {
        return a + b + c
    }

    func tinhDienTich() -> Double {
        let p: Int = self.tinhChuVi() / 2
        let binhPhuong: Int = p * (p - a) * (p - b) * (p - c)
        return sqrt(Double(binhPhuong))
    }
}

var daGiac = DaGiac(soCanh: 5, kichThuocCanh: [2, 3, 4, 6, 5])
print(daGiac.tinhChuVi())
print(daGiac.inGiaTriCacCanh())
var tamGiac = TamGiac(kichThuocCanh: [2,3,4])
print(tamGiac.tinhDienTich())
