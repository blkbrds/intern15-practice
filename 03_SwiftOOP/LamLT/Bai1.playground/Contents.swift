import UIKit

class Fraction {
    var numerator: Int
    var denominator: Int

    init(numerator: Int, denominator: Int) {
        self.numerator = numerator
        self.denominator = denominator
    }
    
    func UCLN(a: Int,b: Int) -> Int {
        var x: Int = a
        var y: Int = b
        while x != y {
            if x > y {
                x = x - y
            } else {
                y = y - x
            }
        }
        return x
    }
    
    func minimalistFraction(a1: Int,b1: Int){
        let i = UCLN(a: a1, b: b1)
        let a2: Int = a1 / i
        let b2: Int = b1 / i
        print("\(a2) / \(b2)")
    }
    
    func congPhanSo(f: Fraction){
        let ts: Int = numerator * f.denominator + f.numerator * denominator
        let ms: Int = denominator * f.denominator
        let result = minimalistFraction(a1: ts, b1: ms)
    }
    
    func truPhanSo(f: Fraction){
        let ts: Int = numerator * f.denominator - f.numerator * denominator
        let ms: Int = denominator * f.denominator
        let result = minimalistFraction(a1: ts, b1: ms)
    }
    
    func nhanPhanSo(f: Fraction){
        let ts: Int = numerator * f.numerator
        let ms: Int = denominator * f.denominator
        let result = minimalistFraction(a1: ts, b1: ms)
    }
    
    func chiaPhanSo(f: Fraction){
        let ts: Int = numerator * f.denominator
        let ms: Int = denominator * f.numerator
        let result = minimalistFraction(a1: ts, b1: ms)
    }
}
let frac1 = Fraction(numerator: 15, denominator: 5)
let frac2 = Fraction(numerator: 5, denominator: 10)
var congTest = frac1.congPhanSo(f: frac2)
var truTest = frac1.truPhanSo(f: frac2)
var nhanTest = frac1.nhanPhanSo(f: frac2)
var chiaTest = frac1.chiaPhanSo(f: frac2)
