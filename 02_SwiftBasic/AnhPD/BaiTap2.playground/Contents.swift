import UIKit
func ptBac2(a : Double,b : Double,c : Double) -> String {
    let Delta : Double = ((b * b) - (4 * a * c))
    if (Delta < 0) {
        return("Phương trình vô nghiệm")
    }else if (Delta == 0) {
        let kep : Double = -b / (2 * a)
        return("Phương trình có nghiệm kép = \(kep)")
    }else {
        let x1 : Double = (-b + Delta) / (2 * a)
        let x2 : Double = (-b - Delta) / (2 * a)
        return("Phương trình có 2 nghiệm phân biệt \(x1) và \(x2)")
    }
}
print(ptBac2(a: 1, b: 4, c: 2))
