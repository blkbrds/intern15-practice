import UIKit

class PhanSo {
    var tuSo: Int
    var mauSo: Int
    
    init(tuSo: Int,mauSo: Int) {
        self.tuSo = tuSo
        self.mauSo = mauSo
    }
    
    func inPhanSo() {
        print("\(tuSo) / \(mauSo)")
    }
    
    func phepCong(phanSo: PhanSo) -> String {
        var tu = tuSo * phanSo.mauSo + phanSo.tuSo * mauSo
        var mau = mauSo * phanSo.mauSo
        return("\(tu) / \(mau)")
    }
    func phepTru(phanSo: PhanSo) -> String {
        var tu = tuSo * phanSo.mauSo - phanSo.tuSo * mauSo
        var mau = mauSo * phanSo.mauSo
        return("\(tu) / \(mau)")
    }
    func phepNhan(phanSo: PhanSo) -> String {
        var tu = tuSo * phanSo.tuSo
        var mau = mauSo * phanSo.mauSo
        return("\(tu) / \(mau)")
    }
    func phepChia(phanSo: PhanSo) -> String  {
        var tu = tuSo * phanSo.mauSo
        var mau = phanSo.tuSo * mauSo
        return("\(tu) / \(mau)")
    }
}

var pS1 = PhanSo(tuSo: 3, mauSo: 2)
var pS2 = PhanSo(tuSo: 2, mauSo: 6)


var Cong = pS1.phepCong(phanSo: pS2)
var Tru = pS1.phepTru(phanSo: pS2)
var Nhan = pS1.phepNhan(phanSo: pS2)
var Chia = pS1.phepChia(phanSo: pS2)
print(pS1.inPhanSo())
print(Cong)
print(Tru)
print(Nhan)
print(Chia)



