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

var daGiac = DaGiac(soCanh: 5, mangKichThuocCanh: [3, 6, 7, 20, 200])

print("Chu vi da giac = \(daGiac.tinhChuVi())")
print(daGiac.kichThuocMoiCanh())
