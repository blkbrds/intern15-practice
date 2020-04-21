import UIKit

class PhanSo{
    var tuSo: Int
    var mauSo: Int
    init(tuSo: Int, mauSo: Int) {
        self.tuSo = tuSo
        self.mauSo = mauSo
    }
    func inPhanSo() -> String{
    return "\(tuSo)/\(mauSo)"
    }
    func tongPhanSo(soB: PhanSo) -> PhanSo {
        let tongTuSo = (tuSo * soB.mauSo) + (mauSo * soB.tuSo)
        let tongMauSo = (mauSo * soB.mauSo)
        return PhanSo(tuSo: tongTuSo, mauSo: tongMauSo)
    }
    func hieuPhanSo(soB: PhanSo) -> PhanSo {
        let hieuTuSo = (tuSo * soB.mauSo) - (mauSo * soB.tuSo)
        let hieuMauSo = (mauSo * soB.mauSo)
        return PhanSo (tuSo: hieuTuSo, mauSo: hieuMauSo)
    }
    func tichPhanSo(soB: PhanSo) -> PhanSo {
        let tichTuSo = (tuSo * soB.tuSo)
        let tichMauSo = (mauSo * soB.mauSo)
        return PhanSo(tuSo: tichTuSo, mauSo: tichMauSo)
    }
    func thuongPhanSo(soB: PhanSo) -> PhanSo {
        let thuongTuSo = (tuSo * soB.mauSo)
        let thuongMauSo = (mauSo * soB.tuSo)
        return PhanSo(tuSo: thuongTuSo, mauSo: thuongMauSo)
    }
}
    var soA = PhanSo(tuSo: 4, mauSo: 2)
    var soB = PhanSo(tuSo: 5, mauSo: 3)

    var tong = soA.tongPhanSo(soB: soB)
    var hieu = soA.hieuPhanSo(soB: soB)
    var tich = soA.tichPhanSo(soB: soB)
    var thuong = soA.thuongPhanSo(soB: soB)

print("Tong cua hai phan so \(soA.inPhanSo()) + \(soB.inPhanSo()) la \(tong.inPhanSo())")
print("Hieu cua hai phan so \(soA.inPhanSo()) - \(soB.inPhanSo()) la \(hieu.inPhanSo())")
print("Tich cua hai phan so \(soA.inPhanSo()) * \(soB.inPhanSo()) la \(tich.inPhanSo())")
print("Thuong cua hai phan so \(soA.inPhanSo()) / \(soB.inPhanSo()) la \(thuong.inPhanSo())")

