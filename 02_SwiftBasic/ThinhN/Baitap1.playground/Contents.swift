import UIKit

func tinhSvaV(R: Float, pi: Float) -> String{
    
    
    let S = R * R * 4 * pi
    print (S)
    let V = 4 / 3 * (pi * R * R * R)
    print  (V)
    
    return " Dien tich mat cau la \(S) , the tich mat cau la \(V)"
}
tinhSvaV(R: 10, pi: 3.14)

