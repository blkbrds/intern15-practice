import Foundation
//Xay dung lop stack mo phong ngan xep, kiem tra ngan xep da day chua, trong, them phan tu, xoa phan tu cuoi cung cua ngan xep , in
class Stack {
  var mangsonguyen: [Int] = []
  let soPhanTu: Int
  
  init(soPhanTu: Int) {
    self.soPhanTu = soPhanTu
  }
  
  func stackDay() -> Bool {
    return mangsonguyen.count >= soPhanTu
  }
  
  func stackTrong() -> Bool {
    return mangsonguyen.isEmpty
  }
  
  func them(so: Int) {
    guard !stackDay() else { return }
    mangsonguyen.append(so)
  }
  
  func xoa() {
    guard !stackTrong() else { return }
    mangsonguyen.removeLast()
  }
  
  func inMang() {
    print(mangsonguyen)
  }
}
let a = Stack(soPhanTu: 5)
a.them(so: 1)
a.them(so: 5)
a.them(so: 5)
a.them(so: 10)
a.inMang()
a.stackDay()
a.stackTrong()
a.xoa()
a.inMang()

