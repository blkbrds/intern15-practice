import UIKit

extension Array where Element: Equatable {
    func replacingMultipleOccurrences(using array: (of: Element, with: Element)...) -> Array {
        var newArr: Array<Element> = self
        
        for replacement in array {
            for (index, item) in self.enumerated() {
                if item == replacement.of {
                    newArr[index] = replacement.with
                }
            }
        }
        return newArr
    }
}

let arr = [1, 2, 3, 2, 1]
let newArr = arr.replacingMultipleOccurrences(using: (of: 2, with: 3), (of: 3, with: 4))
print(newArr)
