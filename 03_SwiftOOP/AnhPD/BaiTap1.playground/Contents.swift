import UIKit

class PhanSo {
    var tuSo: Int
    var mauSo: Int

    init?(tuSo: Int,mauSo: Int) {
        if mauSo == 0 {
            return nil
        }
        self.tuSo = tuSo
        self.mauSo = mauSo
    }

    func inPhanSo() {
        print("\(tuSo) / \(mauSo)")
    }

    func phepCong(phanSo: PhanSo) -> Double {
        let tu = tuSo * phanSo.mauSo + phanSo.tuSo * mauSo
        let mau = mauSo * phanSo.mauSo
        return Double(tu) / Double(mau)
    }
    func phepTru(phanSo: PhanSo) -> Double {
        let tu = tuSo * phanSo.mauSo - phanSo.tuSo * mauSo
        let mau = mauSo * phanSo.mauSo
        return Double(tu) / Double(mau)
    }
    func phepNhan(phanSo: PhanSo) -> Double {
        let tu = tuSo * phanSo.tuSo
        let mau = mauSo * phanSo.mauSo
        return Double(tu) / Double(mau)
    }
    func phepChia(phanSo: PhanSo) -> Double? {
        if phanSo.tuSo == 0 {
            return nil
        }
        let tu = tuSo * phanSo.mauSo
        let mau = phanSo.tuSo * mauSo
        return Double(tu) / Double(mau)
    }
}

var pS1 = PhanSo(tuSo: 3, mauSo: 4)
var pS2 = PhanSo(tuSo: 0, mauSo: 4)

if let pS1 = pS1, let pS2 = pS2 {
    let Cong = pS1.phepCong(phanSo: pS2)
    let Tru = pS1.phepTru(phanSo: pS2)
    let Nhan = pS1.phepNhan(phanSo: pS2)
    let Chia = pS1.phepChia(phanSo: pS2)
    print("Cong: \(Cong)")
    print("Tru: \(Tru)")
    print("Nhan: \(Nhan)")
    print("Chia: \(Chia)")
} else {
    print("Mau so khong duoc bang 0")
}




