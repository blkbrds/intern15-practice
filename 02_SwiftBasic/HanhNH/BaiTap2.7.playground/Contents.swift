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
let arr = [1, 2, 1]
let newArr = arr.replacingMultipleOccurrences(using: (of: 1, with: 3), (of: 2, with: 4))
print("chuỗi sau khi thay đổi là : ", newArr)
