import UIKit

class PhanSo {
    let tuSo: Int
    let mauSo: Int
    
    init(tuSo: Int, mauSo: Int) {
        self.tuSo = tuSo
        self.mauSo = mauSo
    }

    func phepCong(voi a: PhanSo) -> PhanSo {
        let tuSoMoi = self.tuSo * a.mauSo + a.tuSo * self.mauSo
        let mauSoMoi = self.mauSo * a.mauSo
        return PhanSo(tuSo: tuSoMoi, mauSo: mauSoMoi)
    }
}

let a = PhanSo(tuSo: 1, mauSo: 3)
a.cong(voi: PhanSo(tuSo: 4, mauSo: 3))
