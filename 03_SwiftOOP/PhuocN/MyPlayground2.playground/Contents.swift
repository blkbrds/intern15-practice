import UIKit

class HinhVe {
  var chuVi: Float = 0
  var dienTich: Float = 0
}

class HaiChieu: HinhVe {}
class BaChieu: HinhVe {
  var theTich: Float = 0.0
}

class Tron: HaiChieu {
  var banKinh: Float
  init(banKinh: Float) {
    self.banKinh = banKinh
    super.init()
    self.chuVi = .pi * 2 * banKinh
    self.dienTich = .pi * banKinh * banKinh
  }
}

class Vuong: HaiChieu {
  var chieuDai: Float
  var chieuRong: Float
  init(chieuDai: Float, chieuRong: Float) {
    self.chieuDai = chieuDai
    self.chieuRong = chieuRong
    super.init()
    self.chuVi = 2 * (chieuDai + chieuRong)
    self.dienTich = chieuDai * chieuRong
  }
}

class TamGiac: HaiChieu {
  var canhA: Float
  var canhB: Float
  var canhC: Float
  init(canhA: Float, canhB: Float, canhC: Float) {
    self.canhA = canhA
    self.canhB = canhB
    self.canhC = canhC
    super.init()
    self.chuVi = canhC + canhB + canhA
    self.dienTich = sqrtf(chuVi * (chuVi / 2 - canhA) * (chuVi / 2 - canhB) * (chuVi / 2 - canhC))
  }
}

class Cau: BaChieu {
  var banKinh: Float
  init(banKinh: Float) {
     self.banKinh = banKinh
     super.init()
     self.dienTich = 4 * .pi * banKinh * banKinh
     self.theTich = chuVi * banKinh / 3
   }
}

class LapPhuong: BaChieu {
  var chieuDai: Float
  
  init(chieuDai: Float) {
    self.chieuDai = chieuDai
    super.init()
    self.dienTich = 6 * chieuDai * chieuDai
    self.theTich = chieuDai * chieuDai * chieuDai
  }
}
