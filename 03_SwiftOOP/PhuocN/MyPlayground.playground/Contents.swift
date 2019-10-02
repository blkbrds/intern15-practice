import UIKit

// tao class Da Giac va clas Tam Giac ke thua tu Da giac
class DaGiac {
  let soCanh: Int
  var mangCanh: [Int]

  init?(soCanh: Int, mangCanh: [Int]) {
    guard soCanh != 0 else { return nil }
    self.soCanh = soCanh
    guard mangCanh.count >= soCanh else { return nil }
    self.mangCanh = Array(mangCanh[0..<soCanh])
  }

  func inCacCanh() {
    self.mangCanh.forEach {print($0)}
  }

  func chuVi() -> Int {
     return self.mangCanh.reduce(0) { $0 + $1 }
   }
}

class TamGiac: DaGiac {
  init?(mangCanh: [Int]) {
    super.init(soCanh: 3, mangCanh: mangCanh)
  }

  override func chuVi() -> Int {
    super.chuVi()
  }

  func dienTich() -> Double {
    let p = Double(chuVi())/2
    return sqrt(p * (p - Double(mangCanh[0])) * (p - Double(mangCanh[1])) * (p - Double(mangCanh[2])))
  }
}

func ktTamGiacPytago(tamgiac: TamGiac) -> Bool {
  if tamgiac.mangCanh[0] * tamgiac.mangCanh[0] + tamgiac.mangCanh[1] * tamgiac.mangCanh[1] == tamgiac.mangCanh[2] * tamgiac.mangCanh[2] ||
  tamgiac.mangCanh[0] * tamgiac.mangCanh[0] + tamgiac.mangCanh[2] * tamgiac.mangCanh[2] == tamgiac.mangCanh[1] * tamgiac.mangCanh[1] ||
  tamgiac.mangCanh[2] * tamgiac.mangCanh[2] + tamgiac.mangCanh[1] * tamgiac.mangCanh[1] == tamgiac.mangCanh[0] * tamgiac.mangCanh[0] {
    return true
  }
  return false
}

func tamGiacPytago(in tamgiacs: [TamGiac]) {
  for tamgiac in tamgiacs where ktTamGiacPytago(tamgiac: tamgiac) {
    print(tamgiac.mangCanh)
  }
}
