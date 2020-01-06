import UIKit

class PhanSo {
    let tuSo: Int
    let mauSo: Int

    init(tuSo: Int, mauSo: Int) {
        self.tuSo = tuSo
        self.mauSo = mauSo
    }

    func xuat() -> String {
        return "\(self.tuSo)/\(self.mauSo)"
    }

    func phepCong(voi a: PhanSo) -> PhanSo {
        let tuSoMoi: Int
        let mauSoMoi: Int

        if self.mauSo == a.mauSo {
            tuSoMoi = self.tuSo + a.tuSo
            mauSoMoi = self.mauSo
        } else {
            tuSoMoi = self.tuSo * a.mauSo + a.tuSo * self.mauSo
            mauSoMoi = self.mauSo * a.mauSo
        }
        return PhanSo(tuSo: tuSoMoi, mauSo: mauSoMoi)
    }

    func phepTru(voi a: PhanSo) -> PhanSo {
        let tuSoMoi: Int
        let mauSoMoi: Int

        if self.mauSo == a.mauSo {
            tuSoMoi = self.tuSo - a.tuSo
            mauSoMoi = self.mauSo
        } else {
            tuSoMoi = self.tuSo * a.mauSo - a.tuSo * self.mauSo
            mauSoMoi = self.mauSo * a.mauSo
        }
        return PhanSo(tuSo: tuSoMoi, mauSo: mauSoMoi)
    }
    
    func phepNhan(voi a: PhanSo) -> PhanSo {
        let tuSoMoi: Int = self.tuSo * a.tuSo
        let mauSoMoi: Int = self.mauSo * a.mauSo
        return PhanSo(tuSo: tuSoMoi, mauSo: mauSoMoi)
    }
    
    func phepChia(voi a: PhanSo) -> PhanSo {
        let tuSoMoi: Int = self.tuSo * a.mauSo
        let mauSoMoi: Int = self.mauSo * a.tuSo
        return PhanSo(tuSo: tuSoMoi, mauSo: mauSoMoi)
    }
}

let a: PhanSo = PhanSo(tuSo: 1, mauSo: 3)
let b: PhanSo = a.phepCong(voi: PhanSo(tuSo: 4, mauSo: 3))
let c: PhanSo = a.phepTru(voi: PhanSo(tuSo: 5, mauSo: 3))
let d: PhanSo = a.phepNhan(voi: PhanSo(tuSo: 4, mauSo: 4))
let e: PhanSo = a.phepChia(voi: PhanSo(tuSo: 2, mauSo: 5))
print(b.xuat())
print(c.xuat())
print(d.xuat())
print(e.xuat())
