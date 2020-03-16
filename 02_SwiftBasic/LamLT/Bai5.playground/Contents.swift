import UIKit

class SimilarString {

    func check(mom: String, son: String) -> Int {
        let x = [Character](mom)
        let y = [Character](son)
        let size = y.count
        var dem: Int = 0

        for (index, _) in y.enumerated() {
            for(index1, _) in x.enumerated() {
                if index == size-1 {
                    break
                } else {
                    if y[index] == x[index1] && y[index + 1] == x[index1 + 1] {
                        dem += 1
                    }
                }
            }
        }
        return dem
    }
}

let x = SimilarString()
x.check(mom: "abababaaabbabab", son: "ab")
