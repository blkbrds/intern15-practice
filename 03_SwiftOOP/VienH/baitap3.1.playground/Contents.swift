import UIKit

class PhanSo {
    var tu: Int
    var mau: Int
    init(tu: Int, mau: Int) {
        self.tu = tu
        self.mau = mau
    }

    func cong(voi a: PhanSo) -> PhanSo {
        let tu = self.tu * a.mau + self.mau * a.tu
        let mau = self.mau * a.mau
        return PhanSo(tu: tu, mau: mau)
    }

    func tru(voi a: PhanSo) -> PhanSo {
        let tu = self.tu * a.mau - self.mau * a.tu
        let mau = self.mau * a.mau
        return PhanSo(tu: tu, mau: mau)
    }

    func nhan(voi a: PhanSo) -> PhanSo {
        let tu = self.tu * a.tu
        let mau = self.mau * a.mau
        return PhanSo(tu: tu, mau: mau)
    }

    func chia(voi a: PhanSo) -> PhanSo {
        let tu = self.tu * a.mau
        let mau = self.mau * a.tu
        return PhanSo(tu: tu, mau: mau)
    }

    func inPhanSo() {
        print("\(tu)/\(mau)")
    }
}

var phanSo = PhanSo(tu: 1, mau: 2)
let cong = phanSo.cong(voi: PhanSo(tu: 2, mau: 1))
print("Cong hai phan so la: ")
cong.inPhanSo()
let tru = phanSo.tru(voi: PhanSo(tu: 2, mau: 1))
print("Tru hai phân số là ")
tru.inPhanSo()
let nhan = phanSo.nhan (voi: PhanSo(tu: 2, mau: 1))
print("Nhan hai phan so la:")
nhan.inPhanSo()
let chia = phanSo.chia (voi: PhanSo (tu: 2, mau: 1))
print("Chia hai phan so la:")
chia.inPhanSo()






