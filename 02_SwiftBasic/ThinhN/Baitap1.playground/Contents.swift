import UIKit

func tinhSvaV(r: Float, pi: Float) -> String{
    
    
    let s = r * r * 4 * pi
    print (s)
    let v = 4 / 3 * (pi * r * r * r)
    print  (v)
    
    return " Dien tich mat cau la \(s) , the tich mat cau la \(v)"
}
tinhSvaV(r: 10, pi: 3.14)

