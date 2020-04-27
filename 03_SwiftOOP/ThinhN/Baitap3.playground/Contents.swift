import UIKit
class DaGiac {
    var soCanhDaGiac: Int
    var kichThuocCacCanhDaGiac: [Int]
    init(soCanhDaGiac: Int, kichThuocCacCanhDaGiac: [Int]) {
    self.soCanhDaGiac = soCanhDaGiac
    self.kichThuocCacCanhDaGiac = kichThuocCacCanhDaGiac
    }
    func inCanhDaGiac() {
        let canhDaGiac: [Int] = kichThuocCacCanhDaGiac
        print("Cac canh cua da giac la : \(canhDaGiac)")
    }
    func chuVi() -> Int {
       var tinhChuVi = 0
        for i in 0..<soCanhDaGiac {
            tinhChuVi = kichThuocCacCanhDaGiac[i] + tinhChuVi
        }
    return tinhChuVi
    }
}
var nhapDaGiac = DaGiac(soCanhDaGiac: 5, kichThuocCacCanhDaGiac: [1,3,4,8,7])
class TamGiac: DaGiac {
    var a: Int
    var b: Int
    var c: Int
    init(kichThuocDaGiac: [Int]) {
        a = kichThuocDaGiac[0]
        b = kichThuocDaGiac[1]
        c = kichThuocDaGiac[2]
        super.init(soCanhDaGiac: 3, kichThuocCacCanhDaGiac: kichThuocDaGiac)
    }
    override func chuVi() -> Int {
        return a + b + c
    }
    func tinhDienTich() -> Double {
        let BinhPhuong = (a + b + c) * (a + b - c) * (b + c - a) * (c + a - b)
        return (sqrt(Double(BinhPhuong))) / 4
    }
}
var chieuDaiCanh = TamGiac(kichThuocDaGiac: [3,4,5])
chieuDaiCanh.inCanhDaGiac()
print("Chu vi hinh tam giac la \(chieuDaiCanh.chuVi())")
print("Dien tich hinh tam giac la \(chieuDaiCanh.tinhDienTich())")
