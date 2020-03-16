import UIKit

class TamGiac {
    var a: Int
    var b: Int
    var c: Int
    init(a: Int,b: Int,c: Int) {
        self.a = a
        self.b = b
        self.c = c
    }
    func ktraTamGiac() -> Bool {
        if a + b > c || a + c > b && b + c > a {
            return true
        } else {
            return false
        }
    }
    func ktraPytago() -> Bool{
        if a * a + b * b == c * c || a * a + c * c == b * b || b * b + c * c == a * a {
            return true
        }else {
            return false
        }
    }
    func inCanh(){
        print("\(self.a),\(self.b),\(self.c)")
    }
}
var ktra = TamGiac(a: 3, b: 5, c: 4)
print(ktra.ktraTamGiac())
print(ktra.ktraPytago())
ktra.inCanh()
