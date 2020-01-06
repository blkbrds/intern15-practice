import UIKit

class DaGiac {
    let soCanh: Int
    let kichThuocCanh: [Int]

    init(soCanh: Int, kichThuocCanh: [Int]) {
        self.soCanh = soCanh
        self.kichThuocCanh = kichThuocCanh
    }

    func tinhChuVi() -> Int {
        var chuVi: Int = 0
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
        let p: Int = tinhChuVi() / 2
        let binhPhuong: Int = p * (p - a) * (p - b) * (p - c)
        return sqrt(Double(binhPhuong))
    }
}

func kiemTraPytago(tamGiac: TamGiac) -> Bool {
    return (tamGiac.a * tamGiac.a + tamGiac.b * tamGiac.b == tamGiac.c * tamGiac.c ||
            tamGiac.b * tamGiac.b + tamGiac.c * tamGiac.c == tamGiac.a * tamGiac.a ||
            tamGiac.a * tamGiac.a + tamGiac.c * tamGiac.c == tamGiac.b * tamGiac.b)
}

func lietKeTamGiac(mangTamGiac: [TamGiac]) {
    for tamGiac in mangTamGiac where kiemTraPytago(tamGiac: tamGiac) {
        print("\(tamGiac.a) \(tamGiac.b) \(tamGiac.c)")
    }
}
var daGiac = DaGiac(soCanh: 5, kichThuocCanh: [2, 3, 4, 6, 5])
print(daGiac.tinhChuVi())
print(daGiac.inGiaTriCacCanh())
var tamGiac1 = TamGiac(kichThuocCanh: [2, 3, 4])
var tamGiac2 = TamGiac(kichThuocCanh: [3, 4, 5])
print(tamGiac1.tinhChuVi())
var mangTamGiac: [TamGiac] = [tamGiac1, tamGiac2]
lietKeTamGiac(mangTamGiac: mangTamGiac)
