import UIKit
import Foundation

enum Nghiem {
    case hephuongtrinhvonghiem
    case hephuongtrinhvosonghiem
    case hephuongtrinhco1nghem(x: Float,y: Float)
}

//Ham giai he phuong trinh 2 an
func giaiHePhuongTrinh2an(a1: Float,b1: Float,c1: Float,a2: Float, b2: Float,c2: Float)-> Nghiem{
    
    let D: Float = a1 * b2 - a2 * b1
    let Dx: Float = c1 * b2 - c2 * b1
    let Dy: Float = a1 * c2 - a2 * c1
    
    if D == 0 {
        if Dx == Dy {
        return Nghiem.hephuongtrinhvosonghiem
        }   else {
            return Nghiem.hephuongtrinhvonghiem
        }
}
    else {
        return Nghiem.hephuongtrinhco1nghem(x: Dx / D, y: Dy / D)
    }
}

giaiHePhuongTrinh2an(a1: 2, b1: 3, c1: 5, a2: 4, b2: 6, c2: 10)

