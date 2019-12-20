import UIKit
import Foundation
enum Nghiem {
    case phuongtrinhco1nghiem(x: Float)
     case phuongtrinhvonghiem
    case phuongtrinhcohainghiem(x: Float , y: Float)
     case phuongtrinhvosonghiem
}
//func hinhcau(bk: Float)->(dt: Float,tt: Float){
//    let pi: Float=3.14
//    let dt = 4 * pi * bk * bk
//    let tt = 4/3 * pi * bk * bk * bk
//    return (dt,tt)
//
//}
//print("dien tich la: \((hinhcau(bk: 5)).dt)")
//print("the tich la: \((hinhcau(bk: 5)).tt)")

func tinhPhuongTrinhBac2(a:Float,b:Float,c:Float)-> Nghiem {
    var x1: Float = 0
    var x2: Float = 0
    let delta : Float = Float(b * b - 4 * a * c)
    if a == 0 {
         Nghiem.phuongtrinhco1nghiem(x: -c / b)
    } else if b == 0 {
            return Nghiem.phuongtrinhvonghiem
    } else if c == 0 {
        return Nghiem.phuongtrinhvosonghiem
    } else {
        if delta < 0{
            return Nghiem.phuongtrinhvonghiem
        }
        else if delta == 0 {
            return Nghiem.phuongtrinhco1nghiem(x: -b / (2 * a))
        }
        else {
            return Nghiem.phuongtrinhcohainghiem(x: (-b - sqrt(delta)) / (2 * a), y: (-b + sqrt(delta)) / (2 * a))
        }
    }
    
}
tinhPhuongTrinhBac2(a: 0, b: 0, c: 0)
