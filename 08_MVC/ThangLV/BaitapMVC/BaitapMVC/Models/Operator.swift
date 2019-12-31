import Foundation

enum Operator {
    case add
    case substract
    case multiple
    case devide
    case none
}

final class OperatorManager {
    
    private static var sharedOperatorManager: OperatorManager = {
        let operatorManager = OperatorManager()
        return operatorManager
    }()
    
    class func shared() -> OperatorManager {
        return sharedOperatorManager
    }
    
    var `operator`: Operator = .none
    
    private init() {}
    
    func calculateWithOperator(result: Float?, operand: Float) -> Float? {
        guard let result = result else {
            return nil
        }
        switch self.operator {
        case .add:
            return result + operand
        case .substract:
            return result - operand
        case .multiple:
            return result * operand
        case .devide:
            return (operand != 0) ? result / operand : nil
        case .none:
            return operand
        }
    }
}
