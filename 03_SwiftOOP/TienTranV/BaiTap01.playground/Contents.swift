import UIKit

final class PhanSo {
    var tuSo: Int
    var mauSo: Int

    init(tuSo: Int, mauSo: Int) {
        self.tuSo = tuSo
        self.mauSo = mauSo
    }

    func xuat() -> String {
        return "\(tuSo)/\(mauSo)"
    }

    func phepCong(phanSoThuHai: PhanSo) -> PhanSo {
        let ketQuaTuSo = tuSo * phanSoThuHai.mauSo + phanSoThuHai.tuSo * mauSo
        let ketQuaMauSo = mauSo * phanSoThuHai.mauSo
        return PhanSo(tuSo: ketQuaTuSo, mauSo: ketQuaMauSo)
    }

    func phepTru(phanSoThuHai: PhanSo) -> PhanSo {
        let ketQuaTuSo = tuSo * phanSoThuHai.mauSo - phanSoThuHai.tuSo * mauSo
        let ketQuaMauSo = mauSo * phanSoThuHai.mauSo
        return PhanSo(tuSo: ketQuaTuSo, mauSo: ketQuaMauSo)
    }

    func phepNhan(phanSoThuHai: PhanSo) -> PhanSo {
        let ketQuaTuSo = tuSo * phanSoThuHai.tuSo
        let ketQuaMauSo = mauSo * phanSoThuHai.mauSo
        return PhanSo(tuSo: ketQuaTuSo, mauSo: ketQuaMauSo)
    }

    func phepChia(phanSoThuHai: PhanSo) -> PhanSo {
        let ketQuaTuSo = tuSo * phanSoThuHai.mauSo
        let ketQuaMauSo = mauSo * phanSoThuHai.tuSo
        return PhanSo(tuSo: ketQuaTuSo, mauSo: ketQuaMauSo)
    }
}

var phanSoA = PhanSo(tuSo: 2, mauSo: 5)
var phanSoB = PhanSo(tuSo: 3, mauSo: 4)

var ketQuaPhepCong = phanSoA.phepCong(phanSoThuHai: phanSoB)
var ketQuaPhepTru = phanSoA.phepTru(phanSoThuHai: phanSoB)
var ketQuaPhepNhan = phanSoA.phepNhan(phanSoThuHai: phanSoB)
var ketQuaPhepChia = phanSoA.phepChia(phanSoThuHai: phanSoB)

print("\(phanSoA.xuat()) + \(phanSoB.xuat()) = \(ketQuaPhepCong.xuat())")
print("\(phanSoA.xuat()) - \(phanSoB.xuat()) = \(ketQuaPhepTru.xuat())")
print("\(phanSoA.xuat()) * \(phanSoB.xuat()) = \(ketQuaPhepNhan.xuat())")
print("\(phanSoA.xuat()) / \(phanSoB.xuat()) = \(ketQuaPhepChia.xuat())")
