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
    func kTraTamGiac() {
        if a == b || b == c || a == c {
            print("Day la tam giac can & do dai cua 3 canh lan luot la: a = \(a),b = \(b),c = \(c)")
        } else if a == b && b == c && a == c {
            print("Day la tam giac deu & do dai cua 3 canh lan luot la: a = \(a),b = \(b),c = \(c)")
        } else if a * a == b * b + c * c || b * b == a * a + c * c || c * c == a * a + b * b {
            print("Day la tam giac vuong & do dai cua 3 canh lan luot la: a = \(a),b = \(b),c = \(c)")
        } else  if a + b > c || a + c > b || c + b > a {
            print("Day la tam giac & do dai cua 3 canh lan luot la: a = \(a),b = \(b),c = \(c)")
        } else {
            print("Day khong phai la tam giac")
        }
    }
}
var tg1 = TamGiac(a: 22, b: 10, c: 14)
var tg2 = TamGiac(a: 8, b: 8, c: 8)
tg1.kTraTamGiac()
tg2.kTraTamGiac()
