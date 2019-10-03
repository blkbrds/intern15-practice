import UIKit
    

typealias A = (x1: Double,x2: Double)
enum phuongTrinhBac2 {
 case PTvoNghiem
 case PTvoSoNghiem
 case motNghiem(x: Double)
 case haiNghiem(A)
}
 func tinhNghiem(a: Double, b: Double, c: Double) -> phuongTrinhBac2 {
     if a == 0 {
         if b == 0 {
             if c == 0 {
                 return .PTvoSoNghiem
             }
             return .PTvoNghiem
         } else {
             let x: Double = (-c / b)
             return .motNghiem(x: x)
         }
     } else {
         let denta: Double = b * b - 4 * a * c
         if denta < 0 {
             return .PTvoNghiem
         } else if denta == 0 {
             let x: Double = (-b / (2 * a))
             return .motNghiem(x: x)
         } else {
             let x1: Double = (-b + sqrt(denta)) / (2 * a)
             let x2: Double = (b + sqrt(denta)) / (2 * a)
             return .haiNghiem((x1: x1, x2: x2))
         }
}
}
let nghiem = tinhNghiem(a: 7, b:19, c: 1)
switch nghiem {
case .PTvoNghiem:
 print("PT Vo Nghiem")
case .PTvoSoNghiem:
 print("PT Vo So Nghiem")
case .motNghiem(x: let nghiem):
 print("PT có 1 nghiem  : \(nghiem)")
case .haiNghiem(let nghiem):
 print("PT có 2 nghiem : \(nghiem)")
}
