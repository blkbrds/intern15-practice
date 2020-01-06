import UIKit

class DaGiac {
    var soCanh: Int
    var mangKichThuocCanh: [Int]

    init(soCanh: Int, mangKichThuocCanh: [Int]) {
        self.soCanh = soCanh
        self.mangKichThuocCanh = mangKichThuocCanh
    }

    func tinhChuVi() -> Int {
        var tinhToan = 0
        for i in 0..<soCanh {
            tinhToan += mangKichThuocCanh[i]
        }
        return tinhToan
    }

    func kichThuocMoiCanh() -> [String: Int] {
        var giaTriCacCanh = [String: Int]()
        for i in 0..<soCanh {
            giaTriCacCanh["Canh thu \(i + 1)"] = mangKichThuocCanh[i]
        }
        return giaTriCacCanh
    }
}

class TamGiac: DaGiac {
    var a: Int
    var b: Int
    var c: Int

    init(mangKichThuocCanh: [Int]) {
        a = mangKichThuocCanh[0]
        b = mangKichThuocCanh[1]
        c = mangKichThuocCanh[2]
        super.init(soCanh: 3, mangKichThuocCanh: mangKichThuocCanh)
    }

    override func tinhChuVi() -> Int {
        return a + b + c
    }

    func tinhDienTich() -> Double {
        let p = tinhChuVi() / 2
        let sBinhPhuong = p * (p - a) * (p - b) * (p - c)
        return sqrt(Double(sBinhPhuong))
    }
}

var tamGiac = TamGiac(mangKichThuocCanh: [3, 4, 5])

print("Chu vi cua tam giac = \(tamGiac.tinhChuVi())")
print("Dien tich cua tam giac = \(tamGiac.tinhDienTich())")
print("\(tamGiac.kichThuocMoiCanh())")
