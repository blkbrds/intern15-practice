import UIKit
//baitap02

class DaGiac {
    var soCanh: Int
    var mangKichThuocCanh: [Int]
    init(soCanh: Int, mangKichThuocCanh: [Int]) {
        self.soCanh = soCanh
        self.mangKichThuocCanh = mangKichThuocCanh
    }

    func tinhChuVi() -> Int {
        var chuVi = 0
        for i in 0..<soCanh {
            chuVi += mangKichThuocCanh[i]
        }
        return chuVi
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

//baitap03
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
        super.tinhChuVi()
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

//baiTap04
final class GamePitago {
    var n: Int
    var mangTamGiac: [(Int, Int, Int)]
    init(n: Int, mangTamGiac: [(Int, Int, Int)]) {
        self.n = n
        self.mangTamGiac = mangTamGiac
    }

    func kiemTraPitago(tamGiac: (Int, Int, Int)) -> Bool {
        let a = Double(tamGiac.0)
        let b = Double(tamGiac.1)
        let c = Double(tamGiac.2)
        return pow(a, 2) + pow(b, 2) == pow(c, 2) ? true : (pow(a, 2) + pow(c, 2) == pow(b, 2) ? true : (pow(c, 2) + pow(b, 2) == pow(a, 2) ? true : false))
    }

    func mangTamGiacPitago() -> [(Int, Int, Int)] {
        var mangTamGiacPitago = [(Int, Int, Int)]()
        for i in 0..<mangTamGiac.count where kiemTraPitago(tamGiac: mangTamGiac[i]) {
            mangTamGiacPitago.append(mangTamGiac[i])
        }
        return mangTamGiacPitago
    }
}

var newGame = GamePitago(n: 3, mangTamGiac: [(3, 4, 5), (1, 2, 3), (5, 12, 13)])
print("Mang tam giac Pitago la: \(newGame.mangTamGiacPitago())")
