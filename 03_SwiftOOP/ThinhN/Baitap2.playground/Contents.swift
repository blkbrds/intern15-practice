import UIKit

class DaGiac{
    var soCanhDaGiac :Int
    var kichThuocDaGiac :[Int]

    init(soCanhDaGiac:Int,kichThuocDaGiac:[Int]){
    self.soCanhDaGiac = soCanhDaGiac
    self.kichThuocDaGiac = kichThuocDaGiac
    }
    
    func chuVi()->Int{
       var tinhChuVi = 0
        for i in 0..<soCanhDaGiac{
            tinhChuVi = kichThuocDaGiac[i] + tinhChuVi
        }
    return tinhChuVi
    }
}
var nhapDaGiac = DaGiac.init(soCanhDaGiac: 5, kichThuocDaGiac: [1,3,4,8,7])

print("Do dai cac canh da giac la: \(nhapDaGiac.kichThuocDaGiac)")
print("Chu vi cua da giac la: \(nhapDaGiac.chuVi())")
