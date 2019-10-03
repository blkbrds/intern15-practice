import UIKit

// tao class phan so thuc hien cong tru nhan chia phan so
class PhanSo {
  var tuSo: Int
  var mauSo: Int
  
  init?(tuSo: Int, mauSo: Int) {
    guard mauSo != 0 else {
      return nil
    }
    self.tuSo = tuSo
    self.mauSo = mauSo
  }
  
  func inPhanSo() {
    print("\(self.tuSo)/\(self.mauSo)")
  }
  
  func rutGon() -> PhanSo {
    var a = self.tuSo
    var b = self.mauSo
    while a != b {
      if a > b {
        a = a - b
      } else {
        b = b - a
      }
    }
    return PhanSo(tuSo: self.tuSo / a, mauSo: self.mauSo / a) ?? PhanSo(tuSo: 0, mauSo: 1)!
  }
  
  func tong(voi phanSo: PhanSo?) -> PhanSo? {
    guard let phanSo = phanSo else { return nil }
    return PhanSo(tuSo: self.tuSo * phanSo.mauSo + self.mauSo * phanSo.tuSo, mauSo: self.mauSo * phanSo.mauSo)?.rutGon()
  }
  
  func hieu(voi phanSo: PhanSo?) -> PhanSo? {
    guard let phanSo = phanSo else { return nil }
    return PhanSo(tuSo: self.tuSo * phanSo.mauSo - self.mauSo * phanSo.tuSo, mauSo: self.mauSo * phanSo.mauSo)?.rutGon()
  }
  
  func nhan(voi phanSo: PhanSo?) -> PhanSo? {
    guard let phanSo = phanSo else { return nil }
    return PhanSo(tuSo: self.tuSo * phanSo.tuSo, mauSo: self.mauSo * phanSo.mauSo)?.rutGon()
  }
  
  func chia(voi phanSo: PhanSo?) -> PhanSo? {
    guard let phanSo = phanSo else { return nil }
    return PhanSo(tuSo: self.tuSo * phanSo.mauSo, mauSo: self.mauSo * phanSo.tuSo)?.rutGon()
  }
}

let a = PhanSo(tuSo: 30, mauSo: 54)
a?.rutGon()
let p = PhanSo(tuSo: 6, mauSo: 2)
a?.chia(voi: p)
