import Foundation

final class Number {
    var number: Int
    
    
    init(number: Int) {
        self.number = number
    }
}

extension Number {
    static func getDummyDatas() -> [Number] {
        var numbers: [Number] = []
        for i in 1...100 {
            let number = Number(number: i)
            numbers.append(number)
        }
        return numbers
    }
}
