import UIKit
//Baitap 3.5 Xây dựng lớp CStack mô tả hoạt động của ngăn xếp (stack) các số nguyên
class CStack {
   var arr: [Int] = []
   let phanTu: Int
   init(phanTu: Int) {
       self.phanTu = phanTu
   }
   func stackRong() -> Bool {
       return arr.isEmpty
   }
   func stackDay() -> Bool {
       return arr.count >= phanTu
   }
   func xoaStack() {
       guard stackRong() else { return }
       arr.removeLast() //loại bỏ và trar về phàn tử cuối
   }
   func themStack(thanhPhan: Int) {
       guard stackDay() else { return }
       arr.append(thanhPhan)
   }
    func xoa() {
      guard stackRong() else { return }
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
//Bai Tap 3.10 Viết chương trình xây dựng một lớp A tính giá trị của tổng sau: S=1+2+3+...+n (n nguyên dương)
class A {
   static func tinhTong(n: Int) {
       var s = 0
       for i in 1...n {
           s = s + i
       }
       print("tong của phuong trinh S =", s)
   }
}
A.tinhTong(n: 3)
//Bai Tap 3.6 Xây dựng các lớp theo sơ đồ sau. Tạo phương thức cho các lớp trên và cho phép in ra được thông tin của các hình như diện tích, chu vi, thể tích...
class HinhVe {
   var chuVi: Float = 0
   var dienTich: Float = 0
}
class HaiChieu: HinhVe {
}
class BaChieu: HinhVe {
   var theTich: Float = 0
}
class Tron: HaiChieu {
   var banKinhR: Float
   init(banKinhR: Float) {
       self.banKinhR = banKinhR
       super.init()
       self.chuVi = .pi * 2 * banKinhR
       self.dienTich = .pi * banKinhR * banKinhR
       print("chu vi hình tròn là ", chuVi)
       print("diện tích hình tròn là ", dienTich)
   }
}
class Vuong: HaiChieu {
   var canh: Float
   init(canh: Float) {
       self.canh = canh
       super.init()
       self.chuVi = canh * 4
       self.dienTich = canh * canh
       print("chu vi hình vuông là ", chuVi)
       print("diện tích hình vuông là ", dienTich)
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
       print("chu vi hình tam giac là ", chuVi)
       print("diện tích hình tam giac là ", dienTich)
   }
}
class Cau: BaChieu {
   var banKinhR: Float
   init(banKinhR: Float) {
       self.banKinhR = banKinhR
       super.init()
       self.dienTich = 4 * .pi * banKinhR * banKinhR
       self.theTich = dienTich * banKinhR / 3
       print("chu vi hình cầu  là ", dienTich)
       print("thể tích hình cầu là ", theTich)
   }
}
class LapPhuong: BaChieu {
   var chieuDai: Float
   init(chieuDai: Float) {
       self.chieuDai = chieuDai
       super.init()
       self.dienTich = 6 * chieuDai * chieuDai
       self.theTich  = chieuDai * chieuDai * chieuDai
       print("diện tích hình lập phương là ", dienTich)
       print("thể tích hình lập phương là ", theTich)
   }
}
let hinhve = HinhVe()
Tron.init(banKinhR: 3)
Vuong.init(canh: 3)
TamGiac.init(canhA: 3, canhB: 4, canhC: 5)
Cau.init(banKinhR: 3)
LapPhuong.init(chieuDai: 6)



