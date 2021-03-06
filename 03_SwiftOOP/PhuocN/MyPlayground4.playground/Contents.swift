import UIKit

// tao class ngan xep stack thuc hien them xoa tim so lon nhat va be nhat
class CSTack {
  var arr: [Int] = []
  let soPhanTu: Int
  
  init(soPhanTu: Int) {
    self.soPhanTu = soPhanTu
  }
  
  func stackDay() -> Bool {
    return arr.count >= soPhanTu
  }
  
  func stackTrong() -> Bool {
    return arr.isEmpty
  }
  
  func them(element: Int) {
    guard !stackDay() else { return }
    arr.append(element)
  }
  
  func xoa() {
    guard !stackTrong() else { return }
    arr.removeLast()
  }
  
  func inMang() {
    print(arr)
  }
  
  func max() -> Int {
    guard let max = arr.max() else { return 0 }
    return max
  }
  
  func min() -> Int {
    guard let min = arr.min() else { return 0 }
    return min
  }
}

// Tao class A thuc hien phep tinh S = 1 + 2 + 3 + 4 + ... + n
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
