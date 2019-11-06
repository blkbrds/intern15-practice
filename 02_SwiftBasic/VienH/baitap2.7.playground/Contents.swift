import UIKit
extension Array where Element: Equatable {
    func change(using array: (of: Element, with: Element)...) -> Array{
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
let newArr = arr.change (using: (of: 1, with: 4), (of: 2, with: 5))
print("chuỗi sau khi đổi : ", newArr)
