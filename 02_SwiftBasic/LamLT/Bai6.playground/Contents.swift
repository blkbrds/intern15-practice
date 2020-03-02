import UIKit

class Different {
    func swap(arr: [Int]) -> [Int] {
        let x = arr.shuffled()
        return x
    }
}

let x = Different()
x.swap(arr: [1, 2, 3, 4, 5, 6, 7])
