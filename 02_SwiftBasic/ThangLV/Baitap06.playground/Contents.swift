import UIKit

var originalArray = [1, 2, 3, 4, 5, 6, 7, 8, 9]
var shuffledArray = [Int]();

for _ in 0..<originalArray.count
{
    let random = Int(arc4random_uniform(UInt32(Int(originalArray.count))))
    shuffledArray.append(originalArray[random])
    originalArray.remove(at: random)
}

print(shuffledArray)
