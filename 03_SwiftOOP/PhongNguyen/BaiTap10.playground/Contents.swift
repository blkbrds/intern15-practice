import Foundation


class A {
  static func tinhTong(n: Int) -> Int {
    var s = 0
    for i in 1...n {
      s = s + i
    }
    return s
  }
}

A.tinhTong(n: 10)
