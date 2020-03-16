import UIKit

class PhanSo {
    var tuso: Double
    var mauso: Double
    
    init(tuso: Double,mauso: Double) {
        self.tuso = tuso
        self.mauso = mauso
    }
    func inPhanSo() -> String {
        return "\(tuso) / \(mauso)"
    }
    func Cong(phanso: PhanSo) -> PhanSo {
        let tu = tuso * phanso.mauso + phanso.tuso * mauso
        let mau = mauso * phanso.mauso
        return PhanSo (tuso: tu,mauso: mau)
    }
    func Tru(phanso: PhanSo) -> PhanSo {
        let tu = tuso + phanso.mauso - phanso.tuso * mauso
        let mau = mauso * phanso.mauso
        return PhanSo(tuso: tu, mauso: mau)
    }
    func Nhan(phanso: PhanSo) -> PhanSo {
        let tu = tuso * phanso.tuso
        let mau = mauso * phanso.mauso
        return PhanSo(tuso: tu, mauso: mau)
    }
    func Chia(phanso: PhanSo) -> PhanSo {
        let tu = tuso * phanso.mauso
        let mau = phanso.tuso * mauso
        return PhanSo(tuso: tu, mauso: mau)
    }
}
var ps1 = PhanSo(tuso: 2, mauso:4)
var ps2 = PhanSo(tuso: 1, mauso: 6)

var cong = ps1.Cong(phanso: ps2)
var tru = ps1.Tru(phanso: ps2)
var nhan = ps1.Nhan(phanso: ps2)
var chia = ps1.Chia(phanso: ps2)

print(" Ps1 + Ps2 = \(cong.inPhanSo())")
print(" Ps1 + Ps2 = \(tru.inPhanSo())")
print(" Ps1 + Ps2 = \(nhan.inPhanSo())")
print(" Ps1 + Ps2 = \(chia.inPhanSo())")


