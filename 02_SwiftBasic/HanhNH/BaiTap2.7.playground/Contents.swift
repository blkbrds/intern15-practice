import UIKit
public extension Array where Element: Hashable {
    func replacingMultipleOccurrences(using array: (of: Element, with: Element)...) -> Array {
       let replacements = Dictionary<Element, Element>(array, uniquingKeysWith: { $1 })
       return map { replacements[$0] ?? $0 }
   }
}
let arr = [1, 2, 1]
let newArr = arr.replacingMultipleOccurrences(using: (of: 1, with: 3), (of: 2, with: 4))
print("chuỗi sau khi thay đổi là : ", newArr)
