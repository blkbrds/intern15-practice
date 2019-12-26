import Foundation
class DaGiac{
    

    var  socanh: Int
    var kichThuocCanh: [Int]
    
    
    init(socanh: Int, kichThuocCanh: [Int]) {
        self.socanh = socanh
        self.kichThuocCanh = kichThuocCanh
    }
    func tinhChuVi() -> Int {
        var chuVi = 0
        for i in 0..<socanh{
            chuVi += kichThuocCanh[i]
        }
        return chuVi
    }
    func  inCanh() -> [String: Int] {
        var kichThuoc = [String: Int]()
        for i in 0..<socanh{
            kichThuoc["Canh thu \(i + 1)"] = kichThuocCanh[i]
        }
        return kichThuoc
    }
    
}
 var dagiac = DaGiac(socanh: 5, kichThuocCanh: [5,6,7,8,5])
print("chu vi da giac la \(dagiac.tinhChuVi())")
print(dagiac.inCanh())


class tamGiac: DaGiac{
    var a: Int
    var b: Int
    var c: Int
    
    init(kichThuocCanh: [Int]){
        a = kichThuocCanh[0]
        b = kichThuocCanh[1]
        c = kichThuocCanh[2]
        super.init(socanh: 3, kichThuocCanh: kichThuocCanh)
    }
    override func tinhChuVi() -> Int {
        var chuvi = a + b + c
        return chuvi
    }
    
    func tinhDientich() -> Double {
        var p = tinhChuVi() / 2
        var XXX = p * (p - a) * (p - b) * (p - c)
        return sqrt(Double(XXX))
    }
    
}
var tamgiac = tamGiac(kichThuocCanh: [3,4,5])
print("Chu vi cua tam giac : \(tamgiac.tinhChuVi())")
print("Dien tich cua tam giac : \(tamgiac.tinhDientich())")
