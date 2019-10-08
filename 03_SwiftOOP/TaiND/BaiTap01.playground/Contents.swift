import UIKit

class PhanSo {
    var tu: Int = 0
    var mau: Int = 0

    init(tu: Int, mau: Int) {
//        guard mau != 0 else {
//            return nil
//        }
        self.tu = tu
        self.mau = mau
    }
    
    func cong(ps: PhanSo) -> PhanSo {
        let ts = self.tu * ps.mau + ps.tu * self.mau
        let ms = self.mau * ps.mau
        return (PhanSo(tu: ts, mau: ms).rutGon())
    }
    
    func tru(ps: PhanSo) -> PhanSo {
        let ts = self.tu * ps.mau - ps.tu * self.mau
        let ms = self.mau * ps.mau
        return (PhanSo(tu: ts, mau: ms).rutGon())
    }
    
    func nhan(ps: PhanSo) -> PhanSo {
        let ts = self.tu * ps.tu
        let ms = self.mau * ps.mau
        return (PhanSo(tu: ts, mau: ms).rutGon())
    }
    
    func chia(ps: PhanSo) -> PhanSo {
        let ts = self.tu * ps.mau
        let ms = self.mau * ps.mau
        return (PhanSo(tu: ts, mau: ms).rutGon())
    }

    func rutGon() -> PhanSo {
        var a = self.tu
        var b = self.mau
        while (a != b) {
            if (a > b) {
                a = a - b
            } else {
                b = b - a
            }
        }
        return PhanSo(tu: self.tu / a, mau: self.mau / a) ?? PhanSo(tu: 0, mau: 1)
    }

    func xuat() {
        print("\(self.tu)/\(self.mau)")
    }
}

let a = PhanSo(tu: 2, mau: 3)
a.cong(ps: PhanSo(tu: 1, mau: 3)).rutGon().xuat()
a.tru(ps: PhanSo(tu: 2, mau: 5)).rutGon().xuat()
a.chia(ps: PhanSo(tu: 2, mau: 2)).rutGon().xuat()
a.nhan(ps: PhanSo(tu: 3, mau: 4)).rutGon().xuat()

