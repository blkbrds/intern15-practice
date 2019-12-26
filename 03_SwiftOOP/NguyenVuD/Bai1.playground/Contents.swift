import Foundation
class PhanSo {
    
    var tuSo: Int
    var mauSo: Int
    
    init(tuSo: Int, mauSo: Int) {
        self.tuSo = tuSo
        self.mauSo = mauSo
    }
    
    func xuat(){
        print("\(tuSo) / \(mauSo)")
    }
    
    func congHaiPhanSo(phanSo2: PhanSo) -> PhanSo {
        let tu = tuSo * phanSo2.mauSo + mauSo * phanSo2.tuSo
        let mau = mauSo * phanSo2.mauSo
        return PhanSo(tuSo: tu, mauSo: mau)
    }
    
    func truHaiPhanSo(phanSo2: PhanSo) -> PhanSo {
        let tu = tuSo * phanSo2.mauSo - mauSo * phanSo2.tuSo
        let mau = mauSo * phanSo2.mauSo
        return PhanSo(tuSo: tu, mauSo: mau)
    }
    
    func nhanHaiPhanSo(phanSo2: PhanSo) -> PhanSo {
        let tu = tuSo * phanSo2.tuSo
        let mau = mauSo * phanSo2.mauSo
        return PhanSo(tuSo: tu, mauSo: mau)
    }
    
    func chiaHaiPhanSo(phanSo2: PhanSo) -> PhanSo {
        let tu = tuSo * phanSo2.mauSo
        let mau = mauSo * phanSo2.tuSo
        return PhanSo(tuSo: tu, mauSo: mau)
    }
}

var phanSoA = PhanSo(tuSo: 2, mauSo: 3)
var phanSoB = PhanSo(tuSo: 3, mauSo: 2)

var cong = phanSoA.congHaiPhanSo(phanSo2: phanSoB)
var tru = phanSoA.truHaiPhanSo(phanSo2: phanSoB)
var nhan = phanSoA.nhanHaiPhanSo(phanSo2: phanSoB)
var chia = phanSoA.chiaHaiPhanSo(phanSo2: phanSoB)

print("\(phanSoA.xuat()) + \(phanSoB.xuat()) = \(cong.xuat())")
print("\(phanSoA.xuat()) - \(phanSoB.xuat()) = \(tru.xuat())")
print("\(phanSoA.xuat()) * \(phanSoB.xuat()) = \(nhan.xuat())")
print("\(phanSoA.xuat()) / \(phanSoB.xuat()) = \(chia.xuat())")
