import Foundation

final class Operands {
    // MARK: - Properties
    var number: Float = 0
    var numbers: [Float] = []
    
    // MARK: - Functionx
    func addNumbers(number: Float) -> Float {
        if self.number * 10 + number <= 999999 {
           self.number = self.number * 10 + number
        }
        return self.number
    }
}
