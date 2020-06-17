//import UIKit

class PhanSo {
    var tu:Int
    var mau:Int
    
    init(tu:Int, mau:Int) {
        self.tu = tu
        self.mau = mau
    }
    func congPhanso(p2:PhanSo) -> PhanSo {
        let ptu = tu * p2.mau + p2.tu + mau
        let pmau = mau * p2.mau
        return PhanSo(tu:ptu, mau:pmau)
    }
    func truPhanSo(p2:PhanSo) -> PhanSo {
        let ptu = tu * p2.mau - p2.tu + mau
        let pmau = mau * p2.mau
        return PhanSo(tu: ptu, mau: pmau)
    }
    func nhanPhanSo(p2:PhanSo) -> PhanSo {
        let ptu = tu * p2.tu
        let pmau = mau * p2.mau
        return PhanSo(tu: ptu, mau: pmau)
    }
    func chiaPhanso(p2:PhanSo) -> PhanSo {
        let ptu = tu * p2.mau
        let pmau = mau * p2.tu
        return PhanSo(tu: ptu, mau: pmau)
    }
    func conv() -> String {
        return "\(tu)/\(mau)"
    }
}
var p1 = PhanSo(tu:2,mau:3)
var p2 = PhanSo(tu:4,mau:5)
let resultCong = p1.congPhanso(p2: p2).conv()
let resultTru = p1.truPhanSo(p2: p2).conv()
let resultNhan = p1.nhanPhanSo(p2: p2).conv()
let resultChia = p1.chiaPhanso(p2: p2).conv()

print("\(p1.conv()) + \(p2.conv()) = \(resultCong)")
print("\(p1.conv()) - \(p2.conv()) = \(resultTru)")
print("\(p1.conv()) * \(p2.conv()) = \(resultNhan)")
print("\(p1.conv()) / \(p2.conv()) = \(resultChia)")
