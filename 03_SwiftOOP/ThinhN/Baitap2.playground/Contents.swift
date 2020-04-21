import UIKit
class DaGiac {
    var soCanhDaGiac: Int
    var kichThuocCacCanhDaGiac: [Int]
    init(soCanhDaGiac: Int, kichThuocDaGiac: [Int]) {
        self.soCanhDaGiac = soCanhDaGiac
        self.kichThuocCacCanhDaGiac = kichThuocDaGiac
    }
    func chuVi() -> Int {
        var tinhChuVi = 0
        for i in 0..<soCanhDaGiac {
            tinhChuVi = kichThuocCacCanhDaGiac[i] + tinhChuVi
        }
    return tinhChuVi
    }
}
var nhapDaGiac = DaGiac(soCanhDaGiac: 5, kichThuocDaGiac: [1,3,4,8,7])
print("Do dai cac canh da giac la: \(nhapDaGiac.kichThuocCacCanhDaGiac)")
print("Chu vi cua da giac la: \(nhapDaGiac.chuVi())")
