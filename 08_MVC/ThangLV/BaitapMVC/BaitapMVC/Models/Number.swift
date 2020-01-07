import Foundation

final class Number {
    var inputNumber: Float = 0
    var calculatedResult: Float? = 0
     
    func convertToNumber(with number: Int) {
        guard number < 10000000 else { return }
        self.inputNumber = self.inputNumber * 10 + Float(number)
    }
}
