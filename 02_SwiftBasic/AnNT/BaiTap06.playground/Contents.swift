import UIKit

func showRandomElement(numbers: [Int]) {
    var indexs = [Int]()
    while true {
        let index = Int.random(in: 0..<numbers.count)
        if !indexs.contains(index) {
            indexs.append(index)
            print("\(numbers[index])", terminator: "  ")
        }
        if indexs.count == numbers.count {
            break
        }
    }
}

showRandomElement(numbers: [0, 2, 3, 4, 5, 6, 8, 9])
