import UIKit

final class Fraction {
    var numerator: Int
    var denominator: Int

    init(numerator: Int, denominator: Int) {
        self.numerator = numerator
        self.denominator = denominator
    }

    func printFractions() -> String {
        return "\(numerator)/\(denominator)"
    }

    func addition(fraction: Fraction) -> Fraction {
        let numeratorResults = numerator * fraction.denominator + fraction.numerator * denominator
        let denominatorResults = denominator * fraction.denominator
        return Fraction(numerator: numeratorResults, denominator: denominatorResults)
    }

    func subtraction(fraction: Fraction) -> Fraction {
        let numeratorResults = numerator * fraction.denominator - fraction.numerator * denominator
        let denominatorResults = denominator * fraction.denominator
        return Fraction(numerator: numeratorResults, denominator: denominatorResults)
    }

   func multiplication(fraction: Fraction) -> Fraction {
        let numeratorResults = numerator * fraction.numerator
        let denominatorResults = denominator * fraction.denominator
        return Fraction(numerator: numeratorResults, denominator: denominatorResults)
    }

    func division(fraction: Fraction) -> Fraction {
        let numeratorResults = numerator * fraction.denominator
        let denominatorResults = denominator * fraction.numerator
        return Fraction(numerator: numeratorResults, denominator: denominatorResults)
    }
}

var fraction1 = Fraction(numerator: 3, denominator: 5)
var fraction2 = Fraction(numerator: 1, denominator: 3)

var add = fraction1.addition(fraction: fraction2)
var sub = fraction1.subtraction(fraction: fraction2)
var multiply = fraction1.multiplication(fraction: fraction2)
var divide = fraction1.division(fraction: fraction2)

print("\(fraction1.printFractions()) + \(fraction2.printFractions()) = \(add.printFractions())")
print("\(fraction1.printFractions()) - \(fraction2.printFractions()) = \(sub.printFractions())")
print("\(fraction1.printFractions()) * \(fraction2.printFractions()) = \(multiply.printFractions())")
print("\(fraction1.printFractions()) / \(fraction2.printFractions()) = \(divide.printFractions())")
