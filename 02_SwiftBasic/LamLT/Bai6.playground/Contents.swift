import UIKit

class Swap {
    func swap(arr: [Int]) -> [Int] {
        let x = arr.shuffled()
        return x
    }
}

let x = Swap()
x.swap(arr: [1, 2, 3, 4, 5, 6, 7])
