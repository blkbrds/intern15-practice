import UIKit

enum Nghiem {
    case phuongtrinhco1nghiem(x: Float)
     case phuongtrinhvonghiem
    case phuongtrinhcohainghiem(x: Float , y: Float)
     case phuongtrinhvosonghiem
}

//Ham giai phuong trinh bac 2
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

