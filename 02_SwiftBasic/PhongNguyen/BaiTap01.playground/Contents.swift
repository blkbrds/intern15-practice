import UIKit
import Foundation
//Ham tinh dien tich va the tich hinh cau
func tinhDienTichTheTichHinhCau(bk: Float)->(dt: Float,tt: Float){
    let pi: Float=3.14
    let dt = 4 * pi * bk * bk
    let tt = 4/3 * pi * bk * bk * bk
    return (dt,tt)
}
print("dien tich la: \((tinhDienTichTheTichHinhCau(bk: 5)).dt)")
print("the tich la: \((tinhDienTichTheTichHinhCau(bk: 5)).tt)")






//Ham giai phuong trinh bac 2
enum Nghiem {
    case phuongtrinhco1nghiem(x: Float)
    case phuongtrinhvonghiem
    case phuongtrinhcohainghiem(x: Float , y: Float)
    case phuongtrinhvosonghiem
}
func tinhPhuongTrinhBac2(a:Float,b:Float,c:Float)-> Nghiem {
    let delta : Float = Float(b * b - 4 * a * c)
    if a == 0 {
        if b == 0 {
            if c == 0 {
                return .phuongtrinhvosonghiem
            }
            return .phuongtrinhvonghiem
        }
        return .phuongtrinhco1nghiem(x: -c / b)
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
tinhPhuongTrinhBac2(a: 5, b: 0, c: 0)


//Ham giai he phuong trinh 2 an
enum NghiemHe {
    case hephuongtrinhvonghiem
    case hephuongtrinhvosonghiem
    case hephuongtrinhco1nghem(x: Float,y: Float)
}
func giaiHePhuongTrinh2an(a1: Float,b1: Float,c1: Float,a2: Float, b2: Float,c2: Float)-> NghiemHe{
    
    let D: Float = a1 * b2 - a2 * b1
    let Dx: Float = c1 * b2 - c2 * b1
    let Dy: Float = a1 * c2 - a2 * c1
    
    if D == 0 {
        if Dx == Dy {
        return NghiemHe.hephuongtrinhvosonghiem
        }   else {
            return NghiemHe.hephuongtrinhvonghiem
        }
}
    else {
        return Nghiem.hephuongtrinhco1nghem(x: Dx / D, y: Dy / D)
    }
}

giaiHePhuongTrinh2an(a1: 2, b1: 3, c1: 5, a2: 4, b2: 6, c2: 10)

//Ham tinh tong fibonaci
func tinhTongFibbo(so: Int)->(Int){
    var a1: Int = 0
    var a2: Int = 1
    var tong: Int = 0
    var tong1: Int = 1
    switch so {
    case 0:
        tong1 = 0
        break
    case 1:
        tong1 = 1
        break
    case 2:
        tong1 = 2
        break
    default:
    for _ in 2...so{
        tong = a1 + a2
        a1 = a2
        a2 = tong
        tong1 += tong
    }
    }
    return tong1
}
print(tinhTongFibbo(so: 90))

func inFibo(so: Int) {
    var fibo: [Int] = []
    fibo = Array(repeating: 0, count: 100)
    fibo[0] = 0
    fibo[1] = 1
    print(fibo[0])
    print(fibo[1])
    for i in 2...so {
        fibo[i] = fibo[i - 1] + fibo[i - 2]
        print(fibo[i])
    }
}
print(inFibo(so: 50))



	
