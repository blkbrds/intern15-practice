import UIKit

class Fraction {
    var numerator: Int
    var denominator: Int

    init(numerator: Int, denominator: Int) {
        self.numerator = numerator
        self.denominator = denominator
    }

    func UCLN(numberOne: Int, numberTwo: Int) -> Int {
        var xInsOfNumberOne: Int = numberOne
        var yInsOfNumberTwo: Int = numberTwo
        while xInsOfNumberOne != yInsOfNumberTwo {
            if xInsOfNumberOne > yInsOfNumberTwo {
                xInsOfNumberOne = xInsOfNumberOne - yInsOfNumberTwo
            } else {
                yInsOfNumberTwo = yInsOfNumberTwo - xInsOfNumberOne
            }
        }
        return x
    }

    func minimalistFraction(numberOne: Int, numberTwo: Int) -> String {
        let i = UCLN(a: a1, b: b1)
        let instaneOfNumberOne: Int = numberOne / i
        let instaneOfNumberTwo: Int = numberTwo / i
        return "\(a2) / \(b2)"
    }

    func congPhanSo(instaneOfFrac: Fraction) -> String {
        let ts: Int = numerator * instaneOfFrac.denominator + instaneOfFrac.numerator * denominator
        let ms: Int = denominator * instaneOfFrac.denominator
        let result = minimalistFraction(numberOne: ts, numberTwo: ms)
        return result
    }

    func truPhanSo(instaneOfFrac: Fraction) -> String {
        let ts: Int = numerator * instaneOfFrac.denominator - instaneOfFrac.numerator * denominator
        let ms: Int = denominator * f.denominator
        let result = minimalistFraction(numberOne: ts, numberTwo: ms)
        return result
    }

    func nhanPhanSo(instaneOfFrac: Fraction) -> String {
        let ts: Int = numerator * instaneOfFrac.numerator
        let ms: Int = denominator * instaneOfFrac.denominator
        let result = minimalistFraction(numberOne: ts, numberTwo: ms)
        return result
    }

    func chiaPhanSo(instaneOfFrac: Fraction) -> String {
        let ts: Int = numerator * f.denominator
        let ms: Int = denominator * f.numerator
        let result = minimalistFraction(numberOne: ts, numberTwo: ms)
        return result
    }
}
let frac1 = Fraction(numerator: 15, denominator: 5)
let frac2 = Fraction(numerator: 5, denominator: 10)
var congTest = frac1.congPhanSo(instaneOfFrac: frac2)
print(congTest)
var truTest = frac1.truPhanSo(instaneOfFrac: frac2)
print(truTest)
var nhanTest = frac1.nhanPhanSo(instaneOfFrac: frac2)
print(nhanTest)
var chiaTest = frac1.chiaPhanSo(instaneOfFrac: frac2)
print(chiaTest)
