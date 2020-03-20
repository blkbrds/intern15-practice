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
    
    func ktraPhanSo() {
        if mauSo != 0 {
            
        }
    }
    func inPhanSo() {
        print("\(tuSo) / \(mauSo)")
    }
    
    func phepCong(phanSo: PhanSo) -> String {
        let tu = tuSo * phanSo.mauSo + phanSo.tuSo * mauSo
        let mau = mauSo * phanSo.mauSo
        return("\(tu) / \(mau)")
    }
    func phepTru(phanSo: PhanSo) -> String {
        let tu = tuSo * phanSo.mauSo - phanSo.tuSo * mauSo
        let mau = mauSo * phanSo.mauSo
        return("\(tu) / \(mau)")
    }
    func phepNhan(phanSo: PhanSo) -> String {
        let tu = tuSo * phanSo.tuSo
        let mau = mauSo * phanSo.mauSo
        return("\(tu) / \(mau)")
    }
    func phepChia(phanSo: PhanSo) -> String  {
        let tu = tuSo * phanSo.mauSo
        let mau = phanSo.tuSo * mauSo
        return("\(tu) / \(mau)")
    }
}

var pS1 = PhanSo(tuSo: 3, mauSo: 4)
var pS2 = PhanSo(tuSo: 2, mauSo: 0)

if let pS1 = pS1, let pS2 = pS2 {
    var Cong = pS1.phepCong(phanSo: pS2)
    var Tru = pS1.phepTru(phanSo: pS2)
    var Nhan = pS1.phepNhan(phanSo: pS2)
    var Chia = pS1.phepChia(phanSo: pS2)
    print("Cong: \(Cong)")
    print("Tru: \(Tru)")
    print("Nhan: \(Nhan)")
    print("Chia: \(Chia)")
} else {
    print("Mau so khong duoc bang 0")
}




