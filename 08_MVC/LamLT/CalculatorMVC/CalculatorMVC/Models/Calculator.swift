
import UIKit

class Calculator: UIView {
    func sum(a: Double, b: Double) -> String {
           return String(a + b)
       }
       
       func sub(a: Double, b: Double) -> String {
           return String(a - b)
       }
       
       func mul(a: Double, b: Double) -> String {
           return String(a * b)
       }
       
       func div(a: Double, b: Double) -> String {
           if b == 0 {
               return "Khong Xac Dinh"
           } else {
               return String(a / b)
           }
       }
       func chiaLayDu(a: Double, b: Double) -> String {
           let c: Int = Int(a) % Int(b)
           if b == 0 {
               return "Khong Xac Dinh"
           } else {
               return String(c)
           }
       }
       func logarit(a: Double, b: Double) -> String {
           return String(pow(a, b))
       }


}
