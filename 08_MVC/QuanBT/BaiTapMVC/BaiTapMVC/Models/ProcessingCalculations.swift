import Foundation

final class Calculations {
    // MARK: - Properties
    static var share = Calculations()
    var test = ""
    var operand: [String] = []
    var result: Float = 0
    
    // MARK: - Function
    func processing(value: Float) -> Float {
        switch test  {
        case "+" :
            return result + value
        case "-" :
            return result - value
        case "x" :
            return result * value
        case "/" :
            if value == 0 {
                return 0
            } else {
                return result / value
            }
        default:
            return 0
        }
    }
}

